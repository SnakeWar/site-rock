<!-- cidades Grid-->
<section class="page-section bg-dark" id="cidades">
    <div class="container pt-5 pb-5">
        <div class="text-center">
            <h2 class="text-uppercase text-white mb-5">cidades</h2>
            {{--                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>--}}
        </div>
        <div class="row justify-content-center">
            @foreach($cities as $item)
                <div class="col p-0 img-cities"
                     style="
                         background-image: url({{asset('storage'). '/' . $item->photo}});
                         background-repeat: no-repeat;
                         background-position: center;
                         background-size: cover;
                         ">
                        <p class="titulo-cidade">{{$item->title}}</p>
                    <a class="stretched-link cidades-link" href="{{route("buscar-por") . "?city=". $item->id}}"></a>
                </div>
            @endforeach
        </div>
    </div>
</section>
