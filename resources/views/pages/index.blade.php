@extends('pages.layouts.app')
@section('content')
    <!-- Masthead-->
    <header class="masthead"
            style="
                background: url({{asset('assets/img/casa-background-filtro.webp')}});
                background-repeat: no-repeat;
                background-attachment: scroll;
                background-position: center center;
                background-size: cover;"
    >
        <div class="container">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">{{ env('APP_NAME', 'Site') }}</h1>
                <p class="lead text-white">{{ env('APP_DESCRIPTION', 'Description') }}</p>
            </div>
            <div class="row masthead__bg_search_form">
                <form action="{{route('buscar')}}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <div class="form-group">
                                <input type="text" name="search" class="form-control form-control__white_border masthead__input_text" placeholder="Escreva o que procura aqui...">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <select name="category" class="form-select form-select__white_border masthead__input_select">
                                <option value="">Categoria</option>
                                @foreach($categories ?? [] as $category)
                                    <option class="masthead__input_option" value="{{$category->id}}">{{$category->title}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-12">
                            <select name="tag" class="form-select form-select__white_border masthead__input_select">
                                <option value="">Tipo</option>
                                @foreach($tags ?? [] as $tag)
                                    <option class="masthead__input_option" value="{{$tag->id}}">{{$tag->title}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-lg-1 col-md-4 col-sm-12"><button type="submit" class="btn btn-lg text-bg-dark" style="width: 100%"><i class="fa fa-search"></i></button></div>
                    </div>
                </form>
            </div>
        </div>
    </header>
    <main>
        <section id="oportunities">
            <div class="album bg-light pt-3 pb-3">
                <div class="container">
                    <div class="text-center">
                        <h2 class="section-heading text-uppercase">Oportunidades</h2>
                        {{--                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>--}}
                    </div>
                    <div class="row row-cols-lg-3 row-cols-sm-1 row-cols-md-2 g-3">
                        @foreach($posts ?? [] as $item)
                            <div class="col">
                                <div class="card shadow-sm">
                                    <a class="stretched-link" href="{{route('post', ['slug' => $item->slug])}}"></a>
                                    <div class="owl-carousel">
                                        <div>
                                            <img src="{{asset("storage/thumbnail/".$item->photo)}}" alt="{{$item->title}}">
                                        </div>
                                        @foreach($item->photos as $photo)
                                            <div>
                                                <img src="{{asset("storage/thumbnail/".$photo->photo)}}" alt="{{$item->title}}">
                                            </div>
                                        @endforeach
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text bold">{{$item->title}}</p>
                                        <p class="card-text">{{$item->description}}</p>
                                        <div class="d-flex justify-content-between align-items-center">
{{--                                                                                    <div class="btn-group">--}}
{{--                                                                                        <button type="button" class="btn btn-sm btn-outline-secondary">View</button>--}}
{{--                                                                                        <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>--}}
{{--                                                                                    </div>--}}
                                            @if($item->dormitorios > 0)
                                                <small class="text-muted">{{$item->dormitorios}} <i class="fas fa fa-bed"></i></small>
                                            @endif
                                            @if($item->banheiros > 0)
                                                <small class="text-muted">{{$item->banheiros}} <i class="fas fa fa-bath"></i></small>
                                            @endif
                                            @if($item->vagas_garagem > 0)
                                                <small class="text-muted">{{$item->vagas_garagem}} <i class="fas fa fa-car"></i></small>
                                            @endif
                                            @if($item->metro_quadrado_privado > 0)
                                                <small class="text-muted">{{$item->metro_quadrado_privado}} <strong>m² Privado</strong></small>
                                            @endif
                                            @if($item->metro_quadrado_total > 0)
                                                <small class="text-muted">{{$item->metro_quadrado_total}} <strong>m² Total</strong></small>
                                            @endif
                                            @if($item->valor > 0)
                                                <small class="text-muted"> | <strong>R$</strong> {{number_format($item->valor, 2, ',', '.')}}</small>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                        @if($posts->isEmpty())
                            <div class="tamanho-300">
                                <h2>Nenhum resultado encontrado!</h2>
                            </div>
                        @endif
                    </div>
                    <div style="margin-top: 15px;" class="row justify-content-center paginacao">
                        <div class="col-2">
                            {{$posts->appends(Request::get('search', 'category', 'tag'))->links('vendor.pagination.bootstrap-4')}}
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- cidades Grid-->
        <section class="page-section bg-dark" id="cidades">
            <div class="container pt-3 pb-3">
                <div class="text-center">
                    <h2 class="text-uppercase text-white mb-3">cidades</h2>
{{--                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>--}}
                </div>
                <div class="row justify-content-center">
                    @foreach($categories as $category)
                    <div class="col-lg-4 col-sm-6 mb-4">
                            <div class="cidades-item">
                                <a class="cidades-link" href="{{route("buscar-por") . "?category=". $category->id}}">
                                    <div class="cidades-hover">
                                        <div class="cidades-hover-content"><i class="fas fa-search fa-3x"></i></div>
                                    </div>
                                    <img class="img-fluid" src="{{asset('assets/img/casa-background-filtro.webp')}}" alt="{{$category->title}}" />
                                </a>
                                <div class="cidades-caption">
                                    <div class="cidades-caption-heading">{{$category->title}}</div>
{{--                                    <div class="cidades-caption-subheading text-muted">Illustration</div>--}}
                                </div>
                            </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </section>
        <section id="about" class="pt-3 pb-3">
            <div class="container marketing">
                <hr class="featurette-divider">
                <div class="row featurette justify-content-center">
                    <div class="col-md-6">
                        <h2 class="featurette-heading fw-normal lh-1">Vinicíus Araújo</h2>
                        <p class="lead">Corretor de Imóveis de alto padrão em Natal e região.</p>
                        <div class="row mb-3">
                            <div class="col-4">
                                <a href="{{env('APP_INSTAGRAM', '')}}"><i class="fa fa-instagram fa-3x"></i></a>
                            </div>
                            <div class="col-4">
                                <a href="{{env('APP_EMAIL', '')}}"><i class="fa fa-envelope fa-3x"></i></a>
                            </div>
                            <div class="col-4">
                                <a href="{{env('APP_WHATSAPP', '')}}"><i class="fa fa-whatsapp fa-3x"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 tamanho-500 img-thumbnail"
                         style="background-image: url({{asset('assets/img/vinicius.jpeg')}});
                         background-repeat: no-repeat;
                         background-position: top center"
                    >
                    </div>
                </div>
                <hr class="featurette-divider">
            </div>
        </section>
    </main>
@endsection
@section('scripts')
    <script>
        $(document).ready(function(){
            $(".owl-carousel").owlCarousel({
                loop:true,
                margin:0,
                nav:true,
                dots:false,
                autoplay:true,
                autoplayTimeout:5000,
                autoplayHoverPause:true,
                autoHeight: true,
                navText: ["<img style='color:black' src='{{env('APP_URL')}}/assets/img/icons/btn-prev.svg'>","<img src='{{env('APP_URL')}}/assets/img/icons/btn-next.svg'>"],
                responsive:{
                    0:{
                        items:1,
                        loop:true
                    },
                    600:{
                        items:1,
                        loop:true
                    },
                    1000:{
                        items:1,
                        loop:true
                    }
                }
            });
        });
    </script>
    <script>
        $(document).ready(function(){
            $('#telephone').mask('(99) 99999-9999');
        });
    </script>
@endsection
