<?php
declare(strict_types=1);

namespace Database\Seeders;

use App\Domain\Product\Model\Product;
use App\Domain\ProductProperty\Model\ProductPropertyValue;
use App\Domain\Property\Property;
use Illuminate\Database\Seeder;

class FillProductPropertiesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $productNames = [
            "Люстра",
            "Светильник",
            "Бра",
            "Торшер",
            "Спот",
            "Подсветка",
        ];

        $properties = [
            "Производитель" => [
                "Artemide",
                "Arte Lamp",
                "Citilux",
            ],
            "Страна" => [
                "Австрия",
                "Бельгия",
                "Дания",
            ],
            "Материал плафона" => [
                "Гипс",
                "Металл",
                "Пластик",
            ],
        ];

        foreach ($productNames as $productName) {
            $product = Product::query()->create([
                'name' => $productName,
                'count' => rand(1,100),
            ]);
            foreach ($properties as $property => $values) {
                $property = Property::query()->firstOrCreate([
                    'name' => $property,
                ]);
                $randomIndex = array_rand($values);
                ProductPropertyValue::query()->create([
                    'product_id' => $product->id,
                    'property_id' => $property->id,
                    'value' => $values[$randomIndex]
                ]);
            }
        }

    }
}
