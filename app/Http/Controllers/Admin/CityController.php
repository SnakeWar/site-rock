<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\CityRequest;
use App\Http\Requests\CityUpdateRequest;
use App\Http\Requests\PostUpdateRequest;
use App\Models\Category;
use App\Models\City;
use App\Models\Neighborhood;
use App\Models\Tag;
use App\Models\Post;
use App\Traits\Functions;
use App\Traits\UploadTraits;
use App\Http\Requests\PostRequest;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class CityController extends Controller
{
    use UploadTraits, Functions;

    private $post;

    public function __construct(City $model, Neighborhood $neighborhood)
    {
        $this->model = $model;
        $this->neighborhood = $neighborhood;
        $this->title = 'Cidades';
        $this->subtitle = 'Cidade';
        $this->middleware('auth');
        $this->admin = 'admin.cities';
        $this->view = 'cities';
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function index()
    {
        return view($this->admin . '.index', [
            'model' => $this->model->with(['user'])->orderBy('id', 'desc')->paginate(10),
            'title' => $this->title,
            'subtitle' => $this->subtitle,
            'admin' => $this->admin,
            'view' => $this->view
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function create()
    {
        return view($this->admin . '.form', [
            'title' => $this->title,
            'subtitle'=> $this->subtitle,
            'admin' => $this->admin,
            'view' => $this->view
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(CityRequest $request)
    {
        $data = $request->all();
        $data['user_id'] = Auth::user()->id;
        $data['slug'] = Str::slug($data['title']);
        if($request->hasFile('photo')) {
            // Pega a imagem e salva no storage
            $data['photo'] = $this->imageUpload($request->file('photo'), $this->view);
        }
        $this->model->create($data);
        flash($this->subtitle . ' Criada com Sucesso!')->success();
        return redirect()->route($this->admin . '.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function edit($id)
    {

        $model = $this->model->findOrFail($id);
        return view($this->admin . '.form', [
            'model' => $model,
            'title' => $this->title,
            'subtitle'=> $this->subtitle,
            'admin' => $this->admin,
            'view' => $this->view
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(CityUpdateRequest $request, $id)
    {
        $data = $request->all();

        $post = $this->model->find($id);

        if($request->hasFile('photo')) {
            // Pega a imagem e salva no storage
            $data['photo'] = $this->imageUpload($request->file('photo'), $this->view, $post->photo);
        }

        $post->update($data);

        flash($this->subtitle . ' Atualizada com Sucesso!')->success();
        return redirect()->route($this->admin . '.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($id)
    {
        $post = $this->model->findOrFail($id);
        $post->delete();

        flash($this->subtitle . ' Removida com Sucesso!')->success();
        return redirect()->route($this->admin . '.index');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function ativo($id)
    {
        $post = $this->model->findOrFail($id);
        if($post->status == false){
            $post->status = true;
            $post->update();
            flash('Ativado!')->success();
            return redirect()->back();
        }
        else{
            $post->status = false;
            $post->update();
            flash('Desativado!')->warning();
            return redirect()->back();
        }
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destaque($id)
    {
        $post = $this->model->findOrFail($id);
        if($post->highlight == false){
            $post->highlight = true;
            $post->update();
            flash('Esse post agora é destaque!')->success();
            return redirect()->back();
        }
        else{
            $post->highlight = false;
            $post->update();
            flash('Esse post deixou de ser destaque!')->warning();
            return redirect()->back();
        }
    }
}
