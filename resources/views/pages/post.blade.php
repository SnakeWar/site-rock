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
                            {!! $post->body !!}
                        </section>
                    </article>
                </div>
                @include('pages.layouts.side-page.side-page')
            </div>
        </div>
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
