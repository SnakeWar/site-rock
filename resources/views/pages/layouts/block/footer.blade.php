<footer class="text-muted pt-5">
    <div class="container">
        <p class="float-end mb-1">
            <button type="button" class="btn text-bg-dark" data-bs-toggle="modal" data-bs-target="#formModal"
                    data-bs-whatever="@mdo">Entre em contato
            </button>
            @include('pages.layouts.form._form_contato')
        </p>
        <p class="mb-1"><img class="logo-footer" src="{{asset('assets/img/logo-preto-branco.webp')}}" alt=""></p>
{{--        <p><strong>{{ env('APP_NAME', 'Site') }}</strong></p>--}}
        <p class="mb-1">
            <a class="text-dark" href="{{route('page', ['page' => 'termos-de-uso'])}}">
                Termos de Uso
            </a>
        </p>
        <p class="mb-1">
            <a class="text-dark" href="{{route('page', ['page' => 'politicas-de-privacidade'])}}">
                Políticas de Privacidade
            </a>
        </p>
    </div>
    <div class="footer-bg container-fluid">
        <p class="mb-0 text-center desenvolvido-por">Desenvolvido por <a class="text-dark" href="https://www.facebook.com/mayrconmarlon/">
                <strong>
                    Mayrcon Márlon
                </strong>
            </a>
        </p>
    </div>
</footer>
@section('numberMask')
    <script>
        $(document).ready(function(){
            $('#telephone').mask('(99) 99999-9999');
        });
    </script>
@endsection
