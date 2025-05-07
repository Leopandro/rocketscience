<?php

namespace App\Domain\Product\Model;

use App\Domain\ProductProperty\Model\ProductPropertyValue;
use App\Domain\Property\Property;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasManyThrough;
use Ramsey\Collection\Collection;

/**
 * @property int $id
 * @property string $name
 * @property int $count
 * @property Collection $properties
 */
class Product extends Model
{
    protected $table = 'product';

    protected $guarded = [];

    public function properties(): HasManyThrough
    {
        return $this->hasManyThrough(Property::class, ProductPropertyValue::class, 'product_id', 'id', 'id', 'property_id');
    }
}
