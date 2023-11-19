<section id="oportunities">
    <div class="album bg-light pt-5 pb-5">
        <div class="container">
            <div class="text-center">
                <h2 class="section-heading text-uppercase mb-5">Postagens @if(!$paginado)  em Destaque @endif</h2>
                {{--                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>--}}
            </div>
            <div class="row row-cols-lg-3 row-cols-sm-1 row-cols-md-2 g-3 justify-content-center">
                @foreach($posts ?? [] as $item)
                    <div class="col">
                        <div class="card shadow-sm">
                            <a class="stretched-link" href="{{route('blog', ['slug' => $item->slug])}}"></a>
                            <div class="owl-carousel">
                                <div
                                    style="
                                        background-image: url('{{asset("storage/thumbnail/".$item->photo)}}');
                                        background-repeat: no-repeat;
                                        background-position: center;
                                        background-size: cover;
                                        height: 300px;
                                        width: 100%;
                                        "
                                >
                                    {{--                                    <img src="{{asset("storage/thumbnail/".$item->photo)}}" alt="{{$item->title}}">--}}
                                </div>
                            </div>
                            <div class="card-body">
                                <p class="card-text"><b>{{$item->title}}</b></p>
                                <p class="card-text">{{$item->description}}</p>
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
                    <div class="col-auto">
                        {{$posts->appends(Request::get('search', 'category', 'tag'))->links('vendor.pagination.bootstrap-4')}}
                    </div>
                </div>
            @else
                <div class="row justify-content-center mt-5">
                    <div class="col-auto">
                        <a href="{{route('blogs')}}" class="btn btn-ver-mais">Veja mais</a>
                    </div>
                </div>
            @endif
        </div>
    </div>
</section>
