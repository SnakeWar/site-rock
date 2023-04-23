function chamadaDoForm(variavelPHP) {
    const errors = JSON.parse(variavelPHP);

    if (errors.name || errors.email || errors.telephone) {
        abrirModal();
        // setTimeout($('#formModal form p').css('display', 'none'), 5000);
    }
}

function abrirModal() {
    $('#formModal').modal('show');
}

setTimeout(abrirModal, 60000); // abre a modal após 60 segundos

