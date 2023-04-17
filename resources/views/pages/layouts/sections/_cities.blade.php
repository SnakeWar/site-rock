<!-- cidades Grid-->
<section class="page-section bg-dark" id="cidades">
    <div class="container pt-5 pb-5">
        <div class="text-center">
            <h2 class="text-uppercase text-white mb-5">cidades</h2>
            {{--                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>--}}
        </div>
        <div class="row justify-content-center">
            @foreach($cities as $item)
                <div class="col-lg-4 col-sm-6 mb-4">
                    <div class="cidades-item">
                        <a class="cidades-link" href="{{route("buscar-por") . "?city=". $item->id}}">
                            <div class="cidades-hover">
                                <div class="cidades-hover-content"><i class="fas fa-search fa-3x"></i></div>
                            </div>
                            <img class="img-fluid" src="{{asset('storage'). '/' . $item->photo}}" alt="{{$item->title}}" />
                        </a>
                        <div class="cidades-caption">
                            <div class="cidades-caption-heading">{{$item->title}}</div>
                            {{--                                    <div class="cidades-caption-subheading text-muted">Illustration</div>--}}
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
