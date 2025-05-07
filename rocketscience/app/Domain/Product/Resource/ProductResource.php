<?php
declare(strict_types=1);

namespace App\Domain\Product\Resource;
use App\Domain\Product\Model\Product;
use App\Domain\ProductProperty\Resource\ProductPropertyResource;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    public function toArray($request): array
    {
        /** @var Product $product */
        $product = $this->resource;

        return [
            'id' => $product->id,
            'name' => $product->name,
            'count' => $product->count,
            'product_property_values' => (new ProductPropertyResource($product->properties))->toArray($request),
        ];
    }
}
