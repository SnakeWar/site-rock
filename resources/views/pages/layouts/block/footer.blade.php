<footer class="text-muted py-5">
    <div class="container">
        <p class="float-end mb-1">
            <button type="button" class="btn text-bg-dark" data-bs-toggle="modal" data-bs-target="#formModal" data-bs-whatever="@mdo">Entre em contato</button>
            @include('pages.layouts.form._form')
        </p>
        <p class="mb-1"><img class="logo-footer" src="{{asset('assets/img/logo-preto-branco.png')}}" alt=""></p><p><strong>{{ env('APP_NAME', 'Site') }}</strong></p>
        <p class="mb-1">
            <a class="text-dark" href="{{route('page', ['page' => 'termos-de-uso'])}}">Termos de Uso</a>
        </p>
        <p class="mb-1">
            <a class="text-dark" href="{{route('page', ['page' => 'politicas-de-privacidade'])}}">Políticas de Privacidade</a>
        </p>
        <p class="mb-0">Desenvolvido por <a class="text-dark" href="https://www.facebook.com/mayrconmarlon/">Mayrcon Márlon</a></p>
    </div>
</footer>
