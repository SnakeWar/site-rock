<?php

namespace App\Http\Controllers\Pages;

use App\Http\Controllers\Controller;
use App\Http\Requests\ContactRequest;
use App\Http\Requests\HomeRequest;
use App\Http\Requests\WorkwithusRequest;
use App\Mail\SendContact;
use App\Models\Blog;
use App\Models\City;
use App\Models\CityNeighborhoods;
use App\Models\Configuration;
use App\Models\Lawyer;
use App\Models\Tag;
use App\Models\Category;
use App\Models\Contact;
use App\Models\Gallery;
use App\Models\Page;
use App\Models\Post;
use App\Models\Product;
use App\Models\Response;
use App\Models\Subsection;
use App\Models\Workwithus;
use App\Traits\UploadTraits;
use Illuminate\Support\Facades\Mail;

class PagesController extends Controller
{
    use UploadTraits;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    /**
     * @var Category
     */
    private $category;
    /**
     * @var Tag
     */
    private $tag;
    /**
     * @var Post
     */
    private $post;
    /**
     * @var City
     */
    private $city;
    /**
     * @var CityNeighborhoods
     */
    private $neighborhood;

    public function __construct(
        Category          $category,
        Post              $post,
        Tag               $tag,
        Configuration     $configuration,
        City              $city,
        CityNeighborhoods $neighborhood,
        Blog              $blog
    )
    {
        $this->category = $category;
        $this->post = $post;
        $this->tag = $tag;
        $this->configuration = $configuration;
        $this->city = $city;
        $this->neighborhood = $neighborhood;
        $this->blog = $blog;
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(
        HomeRequest $request,
        string      $category = null,
        string      $tag = null,
        string      $search = null,
        string      $city = null
    )
    {
        $category = $category ?? $request->input('category');
        $tag = $tag ?? $request->input('tag');
        $search = $search ?? $request->input('search');
        $cityId = $city ?? $request->input('city');
        $neighborhoodId = $request->input('neighborhood') ?? null;
        $configuration = $this->configuration->whereCode('SOBRE_MIM')->first();
        $min = $request->input('min') ?? null;
        $max = $request->input('max') ?? null;

        $posts = $this->searchPosts($category, $tag, $search, $cityId, $neighborhoodId, $min, $max);

        $categories = $this->category->all();
        $tags = $this->tag->all();
        $cities = $this->city->with('neighborhoods')->get();

        return view('pages.index', [
            'posts' => $posts->whereHighlight(1)->orderBy('id', 'desc')->limit(6)->get(),
            'categories' => $categories,
            'tags' => $tags,
            'cities' => $cities,
            'pagina' => 'Home',
            'paginado' => false,
            'configuration' => $configuration
        ]);
    }

    public function posts(HomeRequest $request)
    {
        $category = $category ?? $request->input('category');
        $tag = $tag ?? $request->input('tag');
        $search = $search ?? $request->input('search');
        $cityId = $request->input('city') ?? null;
        $neighborhoodId = $request->input('neighborhood') ?? null;
        $min = $request->input('min') ?? null;
        $max = $request->input('max') ?? null;

        $posts = $this->searchPosts($category, $tag, $search, $cityId, $neighborhoodId, $min, $max);

        $categories = $this->category->all();
        $tags = $this->tag->all();
        $cities = $this->city->with('neighborhoods')->get();

        return view('pages.posts', [
            'posts' => $posts->orderBy('id', 'desc')
                ->paginate(6)
                ->appends(['search' => $request->search, 'category' => $request->category, 'tag' => $request->tag, 'city' => $request->city, 'neighborhood' => $request->neighborhood, 'min' => $request->min, 'max' => $request->max]),
            'categories' => $categories,
            'tags' => $tags,
            'cities' => $cities,
            'pagina' => 'Home',
            'paginado' => true
        ]);
    }

    public function post($slug)
    {
        $post = $this->post->with(['photos', 'categories', 'tags', 'city', 'neighborhood'])->whereStatus(1)->whereSlug($slug)->first();

        if (empty($post)) {
            abort(404);
        }

        $cityId = $post->categories->first()->id ?? 0;
        $posts = $this->post->with('categories')
            ->whereNot('id', $post->id)
            ->whereStatus(1)
            ->where('city_id', $post->city_id)->limit(5)->get();
        $cities = $this->city->all();
        $tags = $this->tag->all();
        return view('pages.post', [
            'post' => $post,
            'pagina' => 'Oportunidade',
            'title' => env('APP_NAME', '') . ' - ' . $post->title,
            'img' => env('APP_URL') . '/storage/' . $post->photo,
            'description' => $post->description,
            'cities' => $cities,
            'tags' => $tags,
            'posts' => $posts
        ]);
    }

    public function blogs(HomeRequest $request)
    {
        $category = $category ?? $request->input('category');
        $tag = $tag ?? $request->input('tag');
        $search = $search ?? $request->input('search');
        $posts = $this->blog
            ->with(['categories', 'tags'])
            ->whereStatus(1)
            ->whereDate('published_at', '<=', date('Y-m-d'));

        if ($category && $category != "Categoria") {
            $posts->whereHas('categories', function ($q) use ($category) {
                $q->where('categories.id', $category);
            });
        }

        if ($tag && $tag != "Tipo") {
            $posts->whereHas('tags', function ($q) use ($tag) {
                $q->where('tags.id', $tag);
            });
        }

        if ($search) {
            $posts->where('title', 'like', '%' . $search . '%');
        }

        $categories = $this->category->all();
        $tags = $this->tag->all();

        return view('pages.blogs', [
            'posts' => $posts->orderBy('id', 'desc')
                ->paginate(6)
                ->appends(['search' => $request->search, 'category' => $request->category, 'tag' => $request->tag]),
            'categories' => $categories,
            'tags' => $tags,
            'pagina' => 'Home',
            'paginado' => true
        ]);
    }

    public function blog($slug)
    {
        $post = $this->blog->with(['categories', 'tags'])->whereStatus(1)->whereSlug($slug)->first();

        if (empty($post)) {
            abort(404);
        }

        $categoryIds = $post->categories->map(function($category) {
            return $category->id;
        });

        $posts = $this->blog->with(['categories' => function ($query) use ($categoryIds) {
            $query->whereIn('categories.id', $categoryIds);
        }])
            ->whereStatus(1)
            ->where('id', '<>', $post->id)
            ->limit(5)
            ->get();

        $tags = $this->tag->all();
        return view('pages.blog', [
            'post' => $post,
            'pagina' => 'Blog',
            'title' => env('APP_NAME', '') . ' - ' . $post->title,
            'img' => env('APP_URL') . '/storage/' . $post->photo,
            'description' => $post->description,
            'tags' => $tags,
            'posts' => $posts
        ]);
    }

    public function page($page)
    {
        $model = $this->configuration->whereCode($page)->first();
        if (empty($model)) {
            abort(404);
        }
        return view('pages.page', ['page' => $model]);
    }

    public function enviar_form(ContactRequest $request)
    {
        $data = $request->all();

        $contact = Contact::create($data);

        if ($contact) {
            flash(' Mensagem enviada com sucesso!')->success();
            Mail::to('contato@viniciusaraujoimoveis.com.br')->send(new SendContact($data));
            return redirect()->back();
        } else {
            flash(' Erro ao enviar a mensagem!')->error();
            return redirect()->back();
        }
    }

    private function searchPosts($category, $tag, $search, $cityId, $neighborhoodId, $min, $max)
    {
        $posts = $this->post
            ->with(['categories', 'tags', 'photos'])
            ->whereStatus(1)
            ->whereDate('published_at', '<=', date('Y-m-d'));

        if ($category === "Categoria") {
            $category = "";
        }

        if ($tag === "Tipo") {
            $tag = "";
        }

        if ($search) {
            $posts->where('title', 'like', '%' . $search . '%');
        }

        if ($category && $category != "Categoria") {
            $posts->whereHas('categories', function ($q) use ($category) {
                $q->where('categories.id', $category);
            });
        }

        if ($tag && $tag != "Tipo") {
            $posts->whereHas('tags', function ($q) use ($tag) {
                $q->where('tags.id', $tag);
            });
        }

        if($min && $max) {
            $posts->whereBetween('valor', [$min, $max]);
        }

        if ($cityId && $neighborhoodId) {
            $posts->where('city_id', $cityId)->where('city_neighborhoods_id', $neighborhoodId);
        } else if ($cityId) {
            $posts->where('city_id', $cityId);
        }

        return $posts;
    }
}
