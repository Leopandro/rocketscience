<?php

namespace App\Domain\ProductProperty\Model;

use Illuminate\Database\Eloquent\Model;

class ProductPropertyValue extends Model
{
    protected $table = 'product_property_value';

    public $timestamps = false;

    protected $guarded = [];
}
