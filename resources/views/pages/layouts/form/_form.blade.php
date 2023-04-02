<div class="modal fade" id="formModal" tabindex="-1" aria-labelledby="formModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="formModalLabel">Posso te ajudar a encontrar o imóvel que deseja</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="{{route('enviar_form')}}" method="post">
                    @csrf
                    <div class="mb-3">
                        <label for="name" class="col-form-label">Nome:</label>
                        <input type="text" class="form-control" id="name">
                    </div>
                    <div class="mb-3">
                        <label for="message-text" class="col-form-label">E-mail:</label>
                        <input type="text" class="form-control" id="email">
                    </div>
                    <div class="mb-3">
                        <label for="message-text" class="col-form-label">Telefone:</label>
                        <input type="text" class="form-control" id="telephone">
                    </div>
                    <div class="mb-3">
                        <button type="submit" class="btn text-bg-dark">Enviar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    setTimeout(function() {
        $('#formModal').modal('show');
    }, 60000); // 60000 = 60 segundos
</script>
