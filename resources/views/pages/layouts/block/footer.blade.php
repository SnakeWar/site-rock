<footer class="text-muted py-5">
    <div class="container">
        <p class="float-end mb-1">
            <button type="button" class="btn text-bg-dark" data-bs-toggle="modal" data-bs-target="#formModal" data-bs-whatever="@mdo">Entre em contato</button>
            @include('pages.layouts.form._form')
        </p>
        <p class="mb-1"><img class="logo-footer" src="{{asset('assets/img/logo.png')}}" alt=""></p><p><strong>{{ env('APP_NAME', 'Site') }}</strong></p>
{{--        <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="/docs/5.3/getting-started/introduction/">getting started guide</a>.</p>--}}
    </div>
</footer>
