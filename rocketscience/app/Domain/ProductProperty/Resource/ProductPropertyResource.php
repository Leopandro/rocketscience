<?php
declare(strict_types=1);

namespace App\Domain\ProductProperty\Resource;

use App\Domain\ProductProperty\Model\ProductPropertyValue;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductPropertyResource extends JsonResource
{
    public function toArray($request): array
    {
        /** @var ProductPropertyValue $productPropertyValue */
        $productPropertyValue = $this->resource;
        return [

        ];
    }
}
