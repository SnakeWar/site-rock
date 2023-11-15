@extends('pages.layouts.app')
@section('content')
    <main>
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-12">
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
                                <a class="badge bg-secondary text-decoration-none link-light" href="{{route('blog-buscar', ['category' => $category->id])}}">{{$category->title}}</a>
                            @endforeach
                            <!-- Post tags-->
                            @foreach($post->tags ?? [] as $tag)
                                <a class="badge bg-secondary text-decoration-none link-light" href="#!">{{$tag->title}}</a>
                            @endforeach
                        </header>
                        <div class="owl-carousel">
                            <!-- Preview image figure-->
                            <img class="img-fluid rounded object-fit-contain w-100" height="500" src="{{asset("storage/".$post->photo)}}" alt="{{$post->title}}" />
                        </div>
                        <!-- Post content-->
                        <section class="mb-5">
                            {!! $post->body !!}
                        </section>
                    </article>
                </div>
{{--                @include('pages.layouts.side-page.side-page')--}}
            </div>
            @if($posts->count() > 0)
                <div class="row">
                    <div class="col-12 my-5">
                        <h1 class="fw-bolder mb-1">Veja outras postagens semelhantes</h1>
                    </div>
                    @foreach($posts ?? [] as $item)
                        <div class="col-lg-4 col-md-4 col-sm-12 mb-1">
                            <div class="card" style="width: 18rem;">
                                <img src="{{asset("storage/thumbnail/".$item->photo)}}" class="card-img-top object-fit-cover" height="150" alt="{{$item->title}}">
                                <div class="card-body">
                                    <h5 class="card-title">{{$item->title}}</h5>
                                    <p class="card-text">{{$item->description}}</p>
                                    <a href="{{route('blog', ['slug' => $item->slug])}}" class="stretched-link"></a>
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
            @endif
        </div>
    </main>
    <div id="relacionados"></div>
@endsection
@section('scripts')
    {{--    Script do schema --}}
    <script type="application/ld+json">
        {
            "@context": "http://schema.org",
            "@type": "BlogPosting",
            "mainEntityOfPage": {
                "@type": "WebPage",
                "@id": "{{route('blog', ['slug' => $post->slug])}}"
            },
            "headline": "{{$post->title}}",
            "image": {
                "@type": "ImageObject",
                "url": "{{asset("storage/".$post->photo)}}",
                "height": 500,
                "width": 500
            },
            "datePublished": "{{$post->published_at}}",
            "dateModified": "{{$post->updated_at}}",
            "author": {
                "@type": "Person",
                "name": "{{$post->user->name}}"
            },
            "publisher": {
                "@type": "Organization",
                "name": "{{env('APP_NAME', '')}}",
                "logo": {
                    "@type": "ImageObject",
                    "url": "{{asset('assets/img/logo-branco-preto.png')}}"
                }
            },
            "description": "{{$post->description}}"
        }
    </script>
{{--Fim Script do schema--}}
    <!-- Make sure you put this AFTER Leaflet's CSS -->
    <script src="{{asset('assets/js/leaflet.js')}}"></script>
    <script>
        var map = L.map('map').setView([{{$post->latitude}}, {{$post->longitude}}], 13);
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
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
