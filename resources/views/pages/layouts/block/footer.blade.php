<div class="footer-bg container-fluid">
    <div class="container">
        <footer class="row row-cols-1 row-cols-sm-2 row-cols-md-5 py-5 my-5 border-top justify-content-center">
            <div class="col-auto mb-3">
                <a href="{{route('home')}}"
                   class="d-flex align-items-center mb-3 link-body-emphasis text-decoration-none text-center">
                    <img class="logo-footer" src="{{asset('assets/img/logo-branco-preto.png')}}" alt="Logo">
                </a>
            </div>
            <div class="col mb-3">
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="{{route('page', ['page' => 'termos-de-uso'])}}"
                                                 class="nav-link p-0 text-center text-white text-uppercase">Termos de
                            Uso</a></li>
                    <li class="nav-item mb-2">
                        <a href="{{route('page', ['page' => 'politicas-de-privacidade'])}}"
                                                 class="nav-link p-0 text-center text-white text-uppercase">
                            Políticas de Privacidade
                        </a>
                    </li>
                    @include('pages.layouts.form._form_contato_modal')
                </ul>
            </div>
            <div class="col mb-3">
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a
                            href="{{Route::is('home') ? '#oportunities' : route('home') . '/#oportunities'}}"
                            class="nav-link p-0 text-center text-white text-uppercase">Oportunidades</a></li>
                    <li class="nav-item mb-2"><a href="{{Route::is('home') ? '#about' : route('home') . '/#about'}}"
                                                 class="nav-link p-0 text-center text-white text-uppercase">Quem Sou</a>
                    </li>
                    <li class="nav-item mb-2">
                        <div class="row justify-content-center">
                            <div class="col-auto">
                                <a type="button" class="btn bg-white text-uppercase text-dark" data-bs-toggle="modal"
                                   data-bs-target="#formModal"
                                   data-bs-whatever="@mdo">Entre em contato
                                </a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </footer>
    </div>

    <p class="mb-0 text-center desenvolvido-por">Desenvolvido por <a class="text-white"
                                                                     href="https://www.facebook.com/mayrconmarlon/">
            <strong>
                Mayrcon Márlon
            </strong>
        </a>
    </p>
</div>
