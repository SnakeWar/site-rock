<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\City;
use Illuminate\Http\Request;
use App\Http\Resources\CityResource;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class CityController extends Controller
{
    private $city;

    /**
     * @param $city
     */
    public function __construct(City $city)
    {
        $this->city = $city;
    }


    public function index(): AnonymousResourceCollection
    {
        return CityResource::collection(City::all());
    }
    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return CityResource
     */
    public function show(int $id): CityResource
    {
        return new CityResource($this->city->whereId($id)->first());

    }

}
