@extends('pages.layouts.app')
@section('content')
    <!-- Masthead-->
    <header class="masthead pt-sm-0"
            style="
                background: url({{asset('assets/img/casa-background-filtro.webp')}});
                background-repeat: no-repeat;
                background-attachment: scroll;
                background-position: center center;
                background-size: cover;"
    >
        <div class="container">
            <div class="col-lg-12 col-md-8 mx-auto">
                <h1 class="fw-light titulo-inicial">{!! $configuration['APP_INDEX_TITLE'] ?? "" !!}</h1>
                <p class="lead text-white">{!! $configuration['APP_INDEX_SUBTITLE'] ?? "" !!}</p>
            </div>
                @include('pages.layouts.form._form_search')
        </div>
    </header>
    <main>
        @include('pages.layouts.sections._oportunities')
        @include('pages.layouts.sections._cities')
        @include('pages.layouts.sections._about')
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
