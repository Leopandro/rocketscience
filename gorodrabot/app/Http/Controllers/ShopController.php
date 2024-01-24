<?php

namespace App\Http\Controllers;

use App\Models\Shop;
use App\Modules\Yandex\Yandex;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class ShopController
{
    public function test(Request $request)
    {
        $query = Shop::query()
            ->selectRaw('article, MAX(price) as price')
            ->orderBy('article')
            ->groupBy('article')
            ->get();
        return response()->json(
            $query->toArray()
        );
    }
    public function addresses(Request $request)
    {
        $query = $request->get('query');
        if ($query) {
            return response()->json(
                Http::get('https://suggest-maps.yandex.ru/v1/suggest', [
                    'bbox' => '55.46,37.08,55.94,38.10',
                    'apikey' => '1c1ae42b-8c5e-4ac9-ae05-dc5f22b2ab82',
                    'text' => $query,
                    'results' => 5
                ])->json());
        }
        return response()->json([], 422);

    }
    public function phpinfo(Request $request)
    {
        echo phpinfo();
    }
}
