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
                            <hr>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">{{\Carbon\Carbon::create($post->created_at)->diffForHumans()}}</div>
                            <!-- Post categories-->
                            @foreach($post->categories as $category)
                                <a class="badge bg-secondary text-decoration-none link-light" href="{{route('buscar', ['category' => $category->id])}}">{{$category->title}}</a>
                            @endforeach
                            @foreach($post->tags as $tag)
                                <a class="badge bg-secondary text-decoration-none link-light" href="#!">{{$tag->title}}</a>
                            @endforeach
                        </header>
                        <div class="owl-carousel">
                            <!-- Preview image figure-->
                            <figure class="mb-4"><img class="img-fluid rounded" src="{{asset("storage/".$post->photo)}}" alt="{{$post->title}}" /></figure>
                            @foreach($post->photos as $photo)
                                <figure class="mb-4"><img class="img-fluid rounded" src="{{asset("storage/".$photo->photo)}}" alt="{{$post->title}}" /></figure>
                            @endforeach
                        </div>
                        <!-- Post content-->
                        <section class="mb-5">
                            {!! $post->body !!}
                        </section>
                    </article>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">Procurar</div>
                        <div class="card-body">
                            <form action="{{route('buscar')}}" method="POST">
                                @csrf
                                <div class="input-group">
                                    <input name="search" class="form-control" type="text" placeholder="Escreva o que procura aqui..." aria-label="Escreva o que procura aqui..." aria-describedby="button-search" />
                                    <button class="btn text-bg-dark" id="button-search" type="button">Enviar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">Categorias / Tags</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        @foreach($categories as $item)
                                            <li><a class="link-dark text-decoration-none" href="{{route('buscar', ['category' => $item->id])}}">{{$item->title}}</a></li>
                                        @endforeach
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        @foreach($tags as $item)
                                            <li><a class="link-dark text-decoration-none" href="{{route('buscar', ['tag' => $item->id])}}">{{$item->title}}</a></li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Side widget-->
                    <div class="card mb-4">
                        <div class="card-header">Relacionados</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        @foreach($posts as $item)
                                            <li class=""><a class="link-dark text-decoration-none" href="{{route('post', ['slug' => $item->slug])}}">{{$item->title}}</a></li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
@section('js')
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
@section('js')
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
