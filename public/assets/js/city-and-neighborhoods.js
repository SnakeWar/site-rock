// Muda a listagem dos bairros de acordo com a cidade selecionada.

function mudarBairros(baseUrl) {
    const cityId = $('#city').val()
    if (cityId === "") {
        $('#neighborhood')
            .html("")
            .append(`<option class="masthead__input_option" value="">Bairro</option>`);
    } else {
        $.get(`${baseUrl}`+`/api/city/${cityId}`, function(data){
            const neighborhoods = data.data.neighborhoods;
            $('#neighborhood')
                .html("")
                .append(`<option class="masthead__input_option" value="">Bairro</option>`);
            neighborhoods.forEach( neighborhood => {
                $('#neighborhood')
                    .append(`<option class="masthead__input_option" value="${neighborhood.id}">${neighborhood.title}</option>`)
            });
        });
    }
}
