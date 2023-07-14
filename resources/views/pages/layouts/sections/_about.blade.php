<section id="about" class="pt-3 pb-3">
    <div class="container marketing">
        <hr class="featurette-divider">
        <div class="row featurette justify-content-center">
            <div class="col-md-6">
                <h2>{!! $configuration['SOBRE_MIM'] !!}</h2>
                <p>Entre em contato nas minhas redes sociais e e-mail:</p>
                <div class="row mb-3 justify-content-between justify-content-lg-start icon-hover d-flex">
                    <div class="col-lg-2 col-md-2 col-auto">
                        <a target="_blank" href="{{$configuration['APP_INSTAGRAM']}}"><i class="fa fa-instagram fa-3x text-dark icon-hover"></i></a>
                    </div>
                    <div class="col-lg-2 col-md-2 col-auto">
                        <a target="_blank" href="mailto:{{$configuration['APP_EMAIL']}}"><i class="fa fa-envelope fa-3x text-dark icon-hover"></i></a>
                    </div>
                    <div class="col-lg-2 col-md-2 col-auto">
                        <a target="_blank" href="{{$configuration['APP_WHATSAPP']}}"><i class="fa fa-whatsapp fa-3x text-dark icon-hover"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <img class="img-thumbnail" src="{{asset('assets/img/vinicius.webp')}}" alt="">
            </div>
        </div>
    </div>
</section>
