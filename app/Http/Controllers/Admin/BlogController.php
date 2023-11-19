<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\BlogRequest;
use App\Http\Requests\BlogUpdateRequest;
use App\Http\Requests\PostUpdateRequest;
use App\Models\Blog;
use App\Models\Category;
use App\Models\City;
use App\Models\CityNeighborhoods;
use App\Models\Tag;
use App\Models\Post;
use App\Traits\Functions;
use App\Traits\UploadTraits;
use App\Http\Requests\PostRequest;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class BlogController extends Controller
{
    use UploadTraits, Functions;

    private $post;

    public function __construct(Blog $post, Category $category, Tag $tag)
    {
        $this->model = $post;
        $this->category = $category;
        $this->tag = $tag;
        $this->title = 'Postagens';
        $this->subtitle = 'Postagem';
        $this->middleware('auth');
        $this->admin = 'admin.blogs';
        $this->view = 'blogs';
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function index()
    {
        return view($this->admin . '.index', [
            'model' => $this->model->with('user')->orderBy('id', 'desc')->paginate(10),
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
        $categories = $this->category->all();
        $tags = $this->tag->all();
        return view($this->admin . '.form', [
            'categories' => $categories,
            'tags' => $tags,
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
    public function store(BlogRequest $request)
    {
        $data = $request->except(['categories', 'tags']);
        $data['slug'] = $this->setTitleAttribute($data['title']);
        $data['published_at'] = \Helper::convertdata_todb($data['published_at']);
        $categories = $request->get('categories', null);
        $tags = $request->get('tags', null);
        $data['user_id'] = Auth::user()->id;
        if($request->hasFile('photo')) {
            // Pega a imagem e salva no storage
            $data['photo'] = $this->imageUploadSemMarcaDagua($request->file('photo'), $this->view);
        }
        $post = $this->model->create($data);

        $post->categories()->sync($categories);
        $post->tags()->sync($tags);
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
        $categories = $this->category->all();
        $tags = $this->tag->all();
        $model = $this->model->findOrFail($id);
        return view($this->admin . '.form', [
            'model' => $model,
            'categories' => $categories,
            'tags' => $tags,
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
    public function update(BlogUpdateRequest $request, $id)
    {
        $data = $request->except(['categories', 'photos', 'tags']);
        $data['published_at'] = \Helper::convertdata_todb($data['published_at']);
        $categories = $request->get('categories', null);
        $tags = $request->get('tags', null);

        $post = $this->model->find($id);

        if($request->hasFile('photo')) {
            // Pega a imagem e salva no storage
            $data['photo'] = $this->imageUploadSemMarcaDagua($request->file('photo'), $this->view, $post->photo);
        }

        $post->update($data);

        if(!is_null($categories))
            $post->categories()->sync($categories);
        if(!is_null($tags))
            $post->tags()->sync($tags);
        //dd($tags, $categories);

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

    public function setTitleAttribute($value)
    {
        $slug = Str::slug($value);
        $matchs = $this->uniqueSlug($slug);
        return $matchs ? $slug . '-' . $matchs : $slug;
    }

    public function uniqueSlug($slug)
    {
        $matchs = $this->model->whereRaw("slug REGEXP '^{$slug}(-[0-9]*)?$'")->count();
        return $matchs;
    }
}
