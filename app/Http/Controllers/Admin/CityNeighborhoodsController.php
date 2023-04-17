<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\City;
use App\Models\CityNeighborhoods;
use App\Models\Neighborhood;
use App\Models\Post;
use App\Models\PostPhotos;
use App\Traits\Functions;
use App\Traits\UploadTraits;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CityNeighborhoodsController extends Controller
{
    use UploadTraits, Functions;

    private $model;

    public function __construct(City $model)
    {
        $this->middleware('auth');
        $this->model = $model;
        $this->admin = 'admin.cities';
        $this->view = 'cities';
        $this->subtitle = 'Bairro';
    }

    public function addNeighborhood(Request $request, int $id) {
        $model = $this->model->find($id);
        $model->neighborhoods()->create([
            'title' => $request->get('title')
        ]);
        return redirect()->route($this->admin . '.edit', ['city' => $id])->withSuccess($this->subtitle . ' adicionadas com sucesso!');
    }

    public function removeNeighborhood(Request $request){

        $bairroId = $request->get('id');

        //removo a imagem do banco
        $removeBairro = CityNeighborhoods::findOrFail($bairroId);
        $Cityid = $removeBairro->first()->city_id;
        $removeBairro->delete();

        return redirect()->route($this->admin . '.edit', ['city' => $Cityid])->withSuccess('Removido com sucesso!');

    }
}
