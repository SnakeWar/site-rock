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
        $posts = $this->post
            ->with(['categories', 'tags', 'photos'])
            ->whereStatus(1)
            ->whereDate('published_at', '<=', date('Y-m-d'));
        $categories = $this->category->all();
        $tags = $this->tag->all();

        if ($search) {
            $posts->where('title', 'like', '%' . $search . '%');
        }
        if ($category) {
            $posts->whereHas('categories', function($q) use($category) {
                $q->where('categories.id', $category);
            });
        }
        if ($tag) {
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

        $post = $this->post->with(['photos', 'categories', 'tags'])->whereSlug($slug)->first();
        if (empty($post)) {
            abort(404);
        }
        $categoryId = $post->categories->first()->id ?? 0;
        $posts = $this->post->with('categories')->whereHas('categories', function($q) use($categoryId) {
            $q->where('categories.id', $categoryId);
        })->get();
        $categories = $this->category->all();
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

    public function galleries($busca = null)
    {
        if ($busca == null || $busca == '') {
            $galleries = $this->gallery->with('photos')->whereStatus(1)
                ->paginate(16);
        } else {
            $galleries = $this->gallery->with('photos')->whereStatus(1)
                ->where('title', 'like', '%' . $busca . '%')
                ->orWhere('body', 'like', '%' . $busca . '%')
                ->paginate(16);
        }


        return view('pages.albuns', [
            'galleries' => $galleries,
            'secao' => 'Comunicação',
            'pagina' => 'Álbuns',

        ]);
    }

    public function gallery($slug)
    {

        $gallery = $this->gallery
            ->whereSlug($slug)
            ->whereStatus(1)
            ->first();
        return view('pages.album', [
            'gallery' => $gallery,
            'secao' => 'Comunicação',
            'pagina' => 'Álbum',
            'title' => env('APP_NAME', 'Título') . ' - ' . $gallery->title,
            'img' => env('APP_URL') . '/storage/' . $gallery->photo,
            'description' => $gallery->description
        ]);
    }

    public function directors()
    {

        return view('pages.directors', [
            'secao' => 'Institucional',
            'pagina' => 'Diretores',

        ]);
    }

    public function statistics()
    {

        return view('pages.estatisticas', [
            'secao' => 'Exame de Ordem',
            'pagina' => 'Estatísticas',

        ]);
    }

    public function subsections()
    {
        $subsecoes = $this->subsections->whereStatus(1)
            ->paginate(8);

        return view('pages.subsecoes', [
            'secao' => 'Institucional',
            'pagina' => 'Subseções',
            'subsecoes' => $subsecoes,

        ]);
    }

    public function subsection($slug)
    {
        $subsection = $this->subsections->whereStatus(1)
            ->whereSlug($slug)
            ->first();

        return view('pages.subsecao', [
            'secao' => 'Institucional',
            'pagina' => 'Subseções',
            'subsection' => $subsection,

        ]);
    }

    public function fale_conosco()
    {

        return view('pages.fale_conosco', [
            'pagina' => '',

        ]);
    }

    public function trabalhe_conosco()
    {
        return view('pages.trabalhe_conosco', [
            'pagina' => ''
        ]);
    }

    public function enviar_trabalhe_conosco(WorkwithusRequest $request)
    {
        $data = $request->all();
        //dd($data);
        if ($request->hasFile('attach')) {
            $data['attach'] = $this->imageUpload($data['attach'], 'trabalhe_conosco');
        }
        $contact = Workwithus::create($data);

        if ($contact) {
            flash(' Mensagem enviada com sucesso!')->success();
            return redirect()->back();
        } else {
            flash(' Erro ao enviar a mensagem!')->warning();
            return redirect()->back();
        }
    }

    public function enviar_fale_conosco(ContactRequest $request)
    {
        $data = $request->all();

        $contact = Contact::create($data);

        if ($contact) {
            flash(' Mensagem enviada com sucesso!')->success();
            return redirect()->back();
        } else {
            flash(' Erro ao enviar a mensagem!')->warning();
            return redirect()->back();
        }
    }

    public function enviar_form(ContactRequest $request)
    {
        $data = $request->all();

        dd($data);

        $contact = Contact::create($data);

        if ($contact) {
            flash(' Mensagem enviada com sucesso!')->success();
            return redirect()->back();
        } else {
            flash(' Erro ao enviar a mensagem!')->warning();
            return redirect()->back();
        }
    }

    public function enviar_busca(Request $request)
    {
        $busca = $request->all();
        if (!isset($busca['q'])) {
            return redirect('/');
        }
        $posts = $this->post->where('title', 'like', '%' . $busca['q'] . '%')->orWhere('description', 'like', '%' . $busca['q'] . '%')->orWhere('body', 'like', '%' . $busca['q'] . '%')->limit(5)->get();
        $pages = $this->page->where('title', 'like', '%' . $busca['q'] . '%')->orWhere('body', 'like', '%' . $busca['q'] . '%')->limit(5)->get();
        $galleries = $this->gallery->where('title', 'like', '%' . $busca['q'] . '%')->orWhere('description', 'like', '%' . $busca['q'] . '%')->limit(5)->get();
        return view('pages.busca', [
            'posts' => $posts,
            'pages' => $pages,
            'galleries' => $galleries,
            'pagina' => 'Busca',
            'secao' => '',
            'buscaPor' => $busca['q']
        ]);
    }
}
