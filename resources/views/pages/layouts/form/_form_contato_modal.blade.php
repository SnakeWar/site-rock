<div class="modal fade" id="formModal" tabindex="-1" aria-labelledby="formModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content p-4">
            <div class="modal-header">
                <div>
                    <h1 class="modal-title fs-5" id="formModalLabel">Posso te ajudar a encontrar o imóvel que deseja</h1>
                    <p>Deixe seus dados de contato que irei te atender de forma especial</p>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                @include('pages.layouts.form._form_contato')
            </div>
        </div>
    </div>
</div>
@section('form')
    <script src="{{asset('assets/js/form.js')}}"></script>
        <script>
            if ($('.alert').length) {
                window.onload = function() {
                    $('#formModal').modal('show');
                };
            }
        </script>
@endsection
