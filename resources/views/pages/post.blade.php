@extends('pages.layouts.app')
@section('content')
    <main>
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1">{{$post->title}}</h1>
                            <hr class="underline">
                            <!-- Post meta content-->
{{--                            <div class="text-muted fst-italic mb-2">{{\Carbon\Carbon::create($post->created_at)->diffForHumans()}}</div>--}}
                            <!-- Post categories-->
                            @foreach($post->categories ?? [] as $category)
                                <a class="badge bg-secondary text-decoration-none link-light" href="{{route('buscar', ['category' => $category->id])}}">{{$category->title}}</a>
                            @endforeach
                            <!-- Post tags-->
                            @foreach($post->tags ?? [] as $tag)
                                <a class="badge bg-secondary text-decoration-none link-light" href="#!">{{$tag->title}}</a>
                            @endforeach
                        </header>
                        <div class="owl-carousel">
                            <!-- Preview image figure-->
                            <img class="img-fluid rounded object-fit-contain w-100" height="500" src="{{asset("storage/".$post->photo)}}" alt="{{$post->title}}" />
                            @foreach($post->photos ?? [] as $photo)
                                <img class="img-fluid rounded object-fit-contain w-100" height="500" src="{{asset("storage/".$photo->photo)}}" alt="{{$post->title}}" />
                            @endforeach
                        </div>
                        <!-- Post content-->
                        <section class="mb-5">
                            <div class="d-flex justify-content-end align-items-center mt-3 propriedade-oportunidade-preco">
                                @if($post->valor > 0)
                                    <small class="text-muted"><strong>R$</strong> {{number_format($post->valor, 2, ',', '.')}}</small>
                                @endif
                            </div>
                            <div class="d-flex justify-content-end align-items-center">
                                <a target="_blank" href="{{$configuration['APP_WHATSAPP']}}%20{{route('post', ['slug' => $post->slug])}}." class="btn cor-whatsapp text-uppercase"><strong>Whatsapp</strong></a>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mt-5 propriedade-oportunidade">
                                @if($post->dormitorios > 0)
                                    <small class="text-muted">{{$post->dormitorios}} <i class="fas fa fa-bed"></i></small>
                                @endif
                                @if($post->banheiros > 0)
                                    <small class="text-muted">{{$post->banheiros}} <i class="fas fa fa-bath"></i></small>
                                @endif
                                @if($post->vagas_garagem > 0)
                                    <small class="text-muted">{{$post->vagas_garagem}} <i class="fas fa fa-car"></i></small>
                                @endif
                                @if($post->metro_quadrado_privado > 0)
                                    <small class="text-muted">{{$post->metro_quadrado_privado}} <strong>m² Privado</strong></small>
                                @endif
                                @if($post->metro_quadrado_total > 0)
                                    <small class="text-muted">{{$post->metro_quadrado_total}} <strong>m² Total</strong></small>
                                @endif
                            </div>
                            <hr>
                        </section>
                        <!-- Post content-->
                        <section class="mb-5">
                            {!! $post->body !!}
                        </section>
                    </article>
                    <div class="row my-5">
                        <div id="map" class="map"></div>
                    </div>
                </div>
                @include('pages.layouts.side-page.side-page')
            </div>
            <div class="row">
                <div class="col-12 my-5">
                    <h1 class="fw-bolder mb-1">Veja outras oportunidades semelhantes</h1>
                </div>
                @foreach($posts ?? [] as $item)
                    <div class="col-lg-4 col-md-4 col-sm-12 mb-1">
                        <div class="card" style="width: 18rem;">
                            <img src="{{asset("storage/thumbnail/".$item->photo)}}" class="card-img-top object-fit-cover" height="150" alt="{{$item->title}}">
                            <div class="card-body">
                                <h5 class="card-title">{{$item->title}}</h5>
                                @if($post->valor > 0)
                                    <small class="text-muted"><strong>R$</strong> {{number_format($post->valor, 2, ',', '.')}}</small>
                                    <p class="card-text">{{$item->description}}</p>
                                @endif
                                <a href="{{route('post', ['slug' => $item->slug])}}" class="stretched-link"></a>
                            </div>
                        </div>
                        {{--                            <li class="">--}}
                        {{--                                <a class="link-dark text-decoration-none" href="{{route('post', ['slug' => $item->slug])}}">--}}
                        {{--                                    <button class="btn btn-sm btn-outline-secondary mb-1">--}}
                        {{--                                        {{$item->title}}--}}
                        {{--                                    </button>--}}
                        {{--                                </a>--}}
                        {{--                            </li>--}}
                    </div>
                @endforeach
            </div>
        </div>
    </main>
    <div id="relacionados"></div>
@endsection
@section('scripts')
    <!-- Make sure you put this AFTER Leaflet's CSS -->
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
            integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
            crossorigin=""></script>
    <script>
        var map = L.map('map').setView([{{$post->latitude}}, {{$post->longitude}}], 13);
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);
        var marker = L.marker([{{$post->latitude}}, {{$post->longitude}}]).addTo(map);
        marker.bindPopup("<b>{{$post->title}}</b><br>{{$post->description}}").openPopup();
    </script>
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
@endsection
@section('mapcss')
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
          integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
          crossorigin=""/>
@endsection
