<section id="oportunities">
    <div class="album bg-light pt-5 pb-5">
        <div class="container">
            <div class="text-center">
                <h2 class="section-heading text-uppercase mb-5">Oportunidades @if(!$paginado)  em Destaque @endif</h2>
                {{--                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>--}}
            </div>
            <div class="row row-cols-lg-3 row-cols-sm-1 row-cols-md-2 g-3 justify-content-center">
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
            @if($paginado)
                <div class="row justify-content-center paginacao mt-5">
                    <div class="col-4">
                        {{$posts->appends(Request::get('search', 'category', 'tag', 'city', 'neighborhood'))->links('vendor.pagination.bootstrap-4')}}
                    </div>
                </div>
            @endif
        </div>
    </div>
</section>
