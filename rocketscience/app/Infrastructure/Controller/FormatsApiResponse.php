<?php

declare(strict_types=1);

namespace App\Infrastructure\Controller;

use Illuminate\Contracts\Pagination\LengthAwarePaginator as LengthAwarePaginatorContract;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

/**
 * Форматирует ответы АПИ, чтобы отдавать их в едином формате
 */
trait FormatsApiResponse
{
    protected function getSuccessResponse(array $data, int $httpCode = Response::HTTP_OK): JsonResponse
    {
        return new JsonResponse([
            'success' => true,
            'data' => $data,
        ], $httpCode);
    }

    protected function getErrorResponse(array $errors, int $httpCode, array $data = []): JsonResponse
    {
        return new JsonResponse([
            'success' => false,
            'data' => $data,
            'errors' => $errors,
        ], $httpCode);
    }

    /**
     * @param string $message
     * @param int $code
     * @param array $data
     * @param string|int $errorCode
     * @return JsonResponse
     */
    protected function getSingleErrorResponse(string $message, int $code = 400, array $data = [], $errorCode = ''): JsonResponse
    {
        return $this->getErrorResponse([
            'code' => $errorCode,
            'source' => '-',
            'title' => $message,
        ], $code, $data);
    }

    /**
     * Форматирует ответ для списка чего либо (список пользователей, список сотрудников)
     * @param LengthAwarePaginatorContract $paginator
     * @param string|JsonResource $jsonResourceClassName
     * @param Request|null $request
     * @param array $meta
     * @return JsonResponse
     */
    protected function getListItemsResponse(
        LengthAwarePaginatorContract $paginator,
        string $jsonResourceClassName,
        ?Request $request,
        array $meta = []
    ): JsonResponse {
        $meta += [
            'current_page' => $paginator->currentPage(),
            'pages_count' => $paginator->lastPage(),
            'total_items' => $paginator->total(),
        ];

        return $this->makeListItemsResponse($paginator, $jsonResourceClassName, $request, $meta);
    }

    /**
     * Форматирует ответ для списка чего либо (список пользователей, список сотрудников)
     * Отличается от getListItemsResponse() тем, что сам не формирует данные о кол-ве страниц
     * @param $collection
     * @param string $jsonResourceClassName
     * @param Request|null $request
     * @param array $meta
     * @return JsonResponse
     */
    protected function makeListItemsResponse(
        $collection,
        string $jsonResourceClassName,
        ?Request $request,
        array $meta = []
    ): JsonResponse {
        $data = [
            'items' => $jsonResourceClassName::collection($collection)->toArray($request),
            'meta' => $meta,
        ];

        return $this->getSuccessResponse($data);
    }

    /**
     * Формирует данные о кол-ве страниц для данных, полученных из эластика
     * @param int $page
     * @param int $count
     * @param array $elasticResponseData
     * @return array
     */
    protected function getElasticMetaData(int $page, int $count, array $elasticResponseData): array
    {
        $totalCount = $elasticResponseData['hits']['total']['value'];

        return [
            'current_page' => $page,
            'pages_count' => $count ? ceil($totalCount / $count) : 0,
            'total_items' => $totalCount,
        ];
    }

    /**
     * Сверяет ключи заголовков и элементов списка
     * @param array $headers
     * @param array|null $item
     */
    private function checkListHeadersKeys(array $headers, ?array $item): void
    {
        if (!$item) {
            return;
        }

        if (array_diff_key($headers, $item)) {
            throw new \RuntimeException('Ключи заголовков не соответствуют ключам элементов items');
        }
    }
}
