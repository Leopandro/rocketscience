<?php
declare(strict_types=1);

namespace App\Http\Controllers;

use App\Domain\Product\Model\Product;
use App\Domain\Product\Resource\ProductResource;
use App\Infrastructure\Controller\FormatsApiResponse;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Spatie\QueryBuilder\QueryBuilder;
use function Laravel\Prompts\select;

class ProductController
{
    use FormatsApiResponse;

    /**
     * Список с фильтром по свойству
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function list(Request $request): \Illuminate\Http\JsonResponse
    {
        $products = QueryBuilder::for(Product::class, $request)
            ->select('product.*')
            ->with('properties')
            ->when($request->get('properties'), function (Builder $query, $properties) {
                $query->leftJoin('product_property_value','product_property_value.product_id','=','product.id');
                $query->leftJoin('property','product_property_value.property_id','=','property.id');
                foreach ($properties as $propertyName => $propertyValues) {
                    $query->orWhere(function($query) use ($propertyName, $propertyValues) {
                        $query->where('property.name', '=', $propertyName);
                        $query->whereIn('product_property_value.value', $propertyValues);
                    });
                }
            })
            ->groupBy('product.id')
            ->paginate($request->get('count') ?? 40);

        return $this->getListItemsResponse($products, ProductResource::class, $request);
    }
}
