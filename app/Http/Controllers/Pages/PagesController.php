<?php

namespace App\Http\Controllers\Pages;

use App\Http\Controllers\Controller;
use App\Http\Requests\ContactRequest;
use App\Http\Requests\HomeRequest;
use App\Http\Requests\WorkwithusRequest;
use App\Models\Lawyer;
use App\Models\Tag;
use Illuminate\Http\Request;
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

    public function __construct(Category   $category,
                                Post       $post,
                                Tag $tag
    )
    {
        $this->category = $category;
        $this->post = $post;
        $this->tag = $tag;
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(HomeRequest $request, String $category = null, String $tag = null, String $search = null)
    {
        $category = $category ?? $request->input('category');
        $tag = $tag ?? $request->input('tag');
        $search = $search ?? $request->input('search');
        // dd($category, $tag, $search, $request);

        if ($category === "Categoria") {
            $category = "";
        }

        if ($tag === "Tipo") {
            $tag = "";
        }

        $posts = $this->post
            ->with(['categories', 'tags', 'photos'])
            ->whereStatus(1)
            ->whereDate('published_at', '<=', date('Y-m-d'));
        $categories = $this->category->all();
        $tags = $this->tag->all();

        if ($search) {
            $posts->where('title', 'like', '%' . $search . '%');
        }
        if ($category && $category != "Categoria") {
            $posts->whereHas('categories', function($q) use($category) {
                $q->where('categories.id', $category);
            });
        }
        if ($tag && $tag != "Tipo") {
            $posts->whereHas('tags', function($q) use($tag) {
                $q->where('tags.id', $tag);
            });
        }
        return view('pages.index', [
            'posts' => $posts->orderBy('id', 'desc')
                ->paginate(6)
                ->appends(['search' => $request->search, 'category' => $request->category, 'tag' => $request->tag]),
            'categories' => $categories,
            'tags' => $tags,
            'pagina' => 'Home',
        ]);
    }

    public function post($slug)
    {
        $post = $this->post->with(['photos', 'categories', 'tags'])->whereStatus(1)->whereSlug($slug)->first();
        if (empty($post)) {
            abort(404);
        }
        $categoryId = $post->categories->first()->id ?? 0;
        $posts = $this->post->with('categories')->whereNot('id', $post->id)->whereHas('categories', function($q) use($categoryId) {
            $q->where('categories.id', $categoryId);
        })->limit(10)->get();
        $categories = $this->category->whereStatus()->all();
        $tags = $this->tag->all();
        return view('pages.post', [
            'post' => $post,
            'pagina' => 'Oportunidade',
            'title' => env('APP_NAME', '') . ' - ' . $post->title,
            'img' => env('APP_URL') . '/storage/' . $post->photo,
            'description' => $post->description,
            'categories' => $categories,
            'tags' => $tags,
            'posts' => $posts
        ]);
    }

//    public function fale_conosco()
//    {
//
//        return view('pages.fale_conosco', [
//            'pagina' => '',
//
//        ]);
//    }

//    public function trabalhe_conosco()
//    {
//        return view('pages.trabalhe_conosco', [
//            'pagina' => ''
//        ]);
//    }

//    public function enviar_trabalhe_conosco(WorkwithusRequest $request)
//    {
//        $data = $request->all();
//        //dd($data);
//        if ($request->hasFile('attach')) {
//            $data['attach'] = $this->imageUpload($data['attach'], 'trabalhe_conosco');
//        }
//        $contact = Workwithus::create($data);
//
//        if ($contact) {
//            flash(' Mensagem enviada com sucesso!')->success();
//            return redirect()->back();
//        } else {
//            flash(' Erro ao enviar a mensagem!')->warning();
//            return redirect()->back();
//        }
//    }

//    public function enviar_fale_conosco(ContactRequest $request)
//    {
//        $data = $request->all();
//
//        $contact = Contact::create($data);
//
//        if ($contact) {
//            flash(' Mensagem enviada com sucesso!')->success();
//            return redirect()->back();
//        } else {
//            flash(' Erro ao enviar a mensagem!')->warning();
//            return redirect()->back();
//        }
//    }

    public function enviar_form(ContactRequest $request)
    {
        $data = $request->all();

        $contact = Contact::create($data);

        if ($contact) {
            flash(' Mensagem enviada com sucesso!')->success();
            return redirect()->back();
        } else {
            flash(' Erro ao enviar a mensagem!')->error();
            return redirect()->back();
        }
    }

//    public function enviar_busca(Request $request)
//    {
//        $busca = $request->all();
//        if (!isset($busca['q'])) {
//            return redirect('/');
//        }
//        $posts = $this->post->where('title', 'like', '%' . $busca['q'] . '%')->orWhere('description', 'like', '%' . $busca['q'] . '%')->orWhere('body', 'like', '%' . $busca['q'] . '%')->limit(5)->get();
//        $pages = $this->page->where('title', 'like', '%' . $busca['q'] . '%')->orWhere('body', 'like', '%' . $busca['q'] . '%')->limit(5)->get();
//        $galleries = $this->gallery->where('title', 'like', '%' . $busca['q'] . '%')->orWhere('description', 'like', '%' . $busca['q'] . '%')->limit(5)->get();
//        return view('pages.busca', [
//            'posts' => $posts,
//            'pages' => $pages,
//            'galleries' => $galleries,
//            'pagina' => 'Busca',
//            'secao' => '',
//            'buscaPor' => $busca['q']
//        ]);
//    }
}
