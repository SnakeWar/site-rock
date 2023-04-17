<section id="about" class="pt-3 pb-3">
    <div class="container marketing">
        <hr class="featurette-divider">
        <div class="row featurette justify-content-center">
            <div class="col-md-6">
                <h2 class="featurette-heading fw-normal lh-1 icon-hover">Vinícius Araújo</h2>
                <p class="lead">{{$configuration->value}}</p>
                <p>Entre em contato nas minhas redes sociais e e-mail:</p>
                <div class="row mb-3 justify-content-start icon-hover d-flex">
                    <div class="col-lg-2 col-md-2 col">
                        <a target="_blank" href="{{env('APP_INSTAGRAM', '')}}"><i class="fa fa-instagram fa-3x text-dark icon-hover"></i></a>
                    </div>
                    <div class="col-lg-2 col-md-2 col">
                        <a target="_blank" href="{{env('APP_EMAIL', '')}}"><i class="fa fa-envelope fa-3x text-dark icon-hover"></i></a>
                    </div>
                    <div class="col-lg-2 col-md-2 col">
                        <a target="_blank" href="{{env('APP_WHATSAPP', '')}}"><i class="fa fa-whatsapp fa-3x text-dark icon-hover"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 tamanho-500 img-thumbnail"
                 style="background-image: url({{asset('assets/img/vinicius.jpeg')}});
                         background-repeat: no-repeat;
                         background-position: top center"
            >
            </div>
        </div>
        <hr class="featurette-divider">
    </div>
</section>
