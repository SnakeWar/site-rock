<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
        <a href="{{route('home')}}">
            <img class="logo" id="logo" src="{{asset('assets/img/logo-branco-preto.webp')}}" alt="Logo">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars ms-1"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                <li class="nav-item"><a class="nav-link" href="{{Route::is('home') ? '#oportunities' : route('home') . '/#oportunities'}}">Oportunidades</a></li>
                <li class="nav-item"><a class="nav-link" href="{{Route::is('home') ? '#about' : route('home') . '/#about'}}">Quem Sou</a></li>
            </ul>
        </div>
    </div>
</nav>

