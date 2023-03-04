@extends('pages.layouts.app')
@section('content')
    <main>

        <section class="py-5 text-center container">
            <div class="row py-lg-5">
                <div class="col-lg-6 col-md-8 mx-auto">
                    <h1 class="fw-light">{{ env('APP_NAME', 'Site') }}</h1>
                    <p class="lead text-muted">{{ env('APP_DESCRIPTION', 'Description') }}</p>
{{--                    <p>--}}
{{--                        <a href="#" class="btn btn-primary my-2">Main call to action</a>--}}
{{--                        <a href="#" class="btn btn-secondary my-2">Secondary action</a>--}}
{{--                    </p>--}}
                </div>
            </div>
        </section>

        <div class="album py-5 bg-light">
            <div class="container">
                <div class="row">
                    <form action="{{route('buscar')}}" method="POST">
                        @method('POST')
                        @csrf
                        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-3 mb-3">
                            <div class="col">
                                <div class="form-group">
                                    <input type="text" name="search" class="form-control" placeholder="Escreva o que procura aqui...">
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-group">
                                    <span class="input-group-text text-bg-dark">Categoria</span>
                                    <select name="category" class="form-control">
                                        <option value="">--- Selecione ---</option>
                                        @foreach($categories as $category)
                                            <option value="{{$category->id}}">{{$category->title}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-group">
                                    <span class="input-group-text text-bg-dark">Tipo</span>
                                    <select name="tag" class="form-control">
                                        <option value="">--- Selecione ---</option>
                                        @foreach($tags as $tag)
                                            <option value="{{$tag->id}}">{{$tag->title}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col"><button type="submit" class="btn text-bg-dark" style="width: 100%">Procurar</button></div>
                        </div>
                    </form>
                </div>
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                    @foreach($highlight ?? [] as $item)
                        <div class="col">
                            <div class="card shadow-sm">
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
{{--                                        <div class="btn-group">--}}
{{--                                            <button type="button" class="btn btn-sm btn-outline-secondary">View</button>--}}
{{--                                            <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>--}}
{{--                                        </div>--}}
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
                                        <small class="text-muted"> | <strong>R$</strong> {{number_format($item->valor)}}</small>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
                <div style="margin-top: 15px;" class="row align-content-center paginacao">
                    <div class="col-2">
                        {{$highlight->appends(Request::get('search', 'category', 'tag'))->links('vendor.pagination.bootstrap-4')}}
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
                margin:10,
                responsiveClass:true,
                autoHeight:true,
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
