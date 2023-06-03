<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\ConfigurationRequest;
use App\Http\Requests\ConfigurationUpdateRequest;
use App\Models\Configuration;
use App\Traits\Functions;

class ConfigurationController extends Controller
{
    use Functions;

    public function __construct(Configuration $model)
    {
        $this->model = $model;
        $this->title = 'Configurações';
        $this->subtitle = 'Configuração';
        $this->middleware('auth');
        $this->admin = 'admin.configurations';
        $this->view = 'configurations';
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view($this->admin . '.index', [
            'model' => $this->model->get(),
            'title' => $this->title,
            'subtitle' => $this->subtitle,
            'admin' => $this->admin
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view($this->admin . '.form',[
            'title' => $this->title,
            'subtitle' => $this->subtitle,
            'admin' => $this->admin
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(ConfigurationRequest $request)
    {
        $data = $request->all();

        $html = $request->input('html');
        echo $html;
        die();
        if (!$html) {
            $data['value'] = strip_tags($data['value']);
        }

        $model = $this->model->create($data);

        if ($model) {
            flash($this->subtitle . ' Criada com Sucesso!')->success();
            return redirect()->route($this->admin . '.index');
        } else {
            flash('Aconteceu um erro!')->danger();
            return redirect()->back();
        }

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
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $model = $this->model->findOrFail($id);
        return view($this->admin . '.form', [
            'model' => $model,
            'title' => $this->title,
            'subtitle' => $this->subtitle,
            'admin' => $this->admin
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ConfigurationUpdateRequest $request, $id)
    {
        $data = $request->all();

        $model = $this->model->find($id);

        $html = $request->input('html');
        if (!$html) {
            $data['value'] = strip_tags($data['value']);
        }

        $model->update($data);

        if ($model) {
            flash($this->subtitle . ' Atualizado com Sucesso!')->success();
            return redirect()->route($this->admin . '.index');
        } else {
            flash('Aconteceu um erro!')->danger();
            return redirect()->back();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $model = $this->model->findOrFail($id);
        $model->delete();

        flash($this->subtitle . ' Removida com Sucesso!')->success();
        return redirect()->route($this->admin . '.index');
    }
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
}
