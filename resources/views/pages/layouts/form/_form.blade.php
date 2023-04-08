<div class="modal fade" id="formModal" tabindex="-1" aria-labelledby="formModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header p-3">
                <div>
                    <h1 class="modal-title fs-5" id="formModalLabel">Posso te ajudar a encontrar o imóvel que deseja</h1>
                    <p>Deixe seus dados de contato que irei te atender de forma especial</p>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                @include('flash::message')
                <form action="{{route('enviar_form')}}" method="post">
                    @csrf
                    <div class="mb-2">
                        <label for="name" class="col-form-label">Nome:</label>
                        <input type="text" class="form-control {{ $errors->has('name') ? 'has-error' : '' }}" id="name" required>
                        @if ($errors->has('name'))
                            <p class="alert alert-danger mt-1">
                                <strong>{{ $errors->first('name') }}</strong>
                            </p>
                        @endif
                    </div>
                    <div class="mb-2">
                        <label for="message-text" class="col-form-label">E-mail:</label>
                        <input type="email" class="form-control {{ $errors->has('email') ? 'has-error' : '' }}" id="email" required>
                        @if ($errors->has('email'))
                            <p class="alert alert-danger mt-1">
                                <strong>{{ $errors->first('email') }}</strong>
                            </p>
                        @endif
                    </div>
                    <div class="mb-2">
                        <label for="message-text" class="col-form-label">Telefone:</label>
                        <input type="text" class="form-control {{ $errors->has('telephone') ? 'has-error' : '' }}" id="telephone" required>
                        @if ($errors->has('telephone'))
                            <p class="alert alert-danger mt-1">
                                <strong>{{ $errors->first('telephone') }}</strong>
                            </p>
                        @endif
                    </div>
                    <div class="mt-2 mb-2">
                        <button type="submit" class="btn text-bg-dark">Enviar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@section('scripts')
    <script src="{{asset('assets/js/form.js')}}"></script>
    <script>
        window.onload = function() {
            chamadaDoForm('<?= $errors ?>');
        }
    </script>
@endsection
