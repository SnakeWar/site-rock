<!-- cidades Grid-->
<section class="page-section bg-dark" id="cidades">
    <div class="container pt-5 pb-5">
        <div class="text-center">
            <h2 class="text-uppercase text-white mb-5">cidades</h2>
            {{--                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>--}}
        </div>
        <div class="row justify-content-center">
            @foreach($cities as $item)
                <div class="col p-0">
                    <a class="cidades-link" href="{{route("buscar-por") . "?city=". $item->id}}">
                        <div class="img-cities"
                             style="
                                 background-image: url({{asset('storage'). '/' . $item->photo}});
                                 ">
                            <p class="titulo-cidade">{{$item->title}}</p>
                        </div>
                    </a>
                </div>
            @endforeach
        </div>
    </div>
</section>
