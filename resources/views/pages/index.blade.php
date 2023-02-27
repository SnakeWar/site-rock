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

                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                    @foreach($highlight as $item)
                        <div class="col">
                            <div class="card shadow-sm">
                                <img src="{{asset("storage/".$item->photo)}}" alt="">
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
                                        <small class="text-muted"> | {{$item->banheiros}} <i class="fas fa fa-bath"></i></small>
                                        @endif
                                        @if($item->vagas_garagem > 0)
                                        <small class="text-muted"> | {{$item->vagas_garagem}} <i class="fas fa fa-car"></i></small>
                                        @endif
                                        @if($item->metro_quadrado_total > 0)
                                        <small class="text-muted"> | {{$item->metro_quadrado_total}} <strong>m² Privado</strong></small>
                                        @endif
                                        @if($item->metro_quadrado_privado > 0)
                                            <small class="text-muted"> | {{$item->metro_quadrado_privado}} <strong>m² Total</strong></small>
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
            </div>
        </div>

    </main>
@endsection
