<form action="{{route('buscar')}}" method="POST">
    @csrf
    <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-12">
            <div class="form-group">
                <input type="text" name="search" class="form-control form-control__white_border masthead__input_text" placeholder="Escreva o que procura aqui...">
            </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12">
            <select id="city" name="city" class="form-select form-select__white_border masthead__input_select">
                <option class="masthead__input_option" value="">Cidade</option>
                @foreach($cities ?? [] as $item)
                <option class="masthead__input_option" value="{{$item->id}}">{{$item->title}}</option>
                @endforeach
            </select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-12">
            <select id="neighborhood" name="neighborhood" class="form-select form-select__white_border masthead__input_select">
                <option value="">Bairro</option>
            </select>
        </div>
        <div class="col-lg-1 col-md-4 col-sm-12"><button type="submit" class="btn btn-lg text-bg-dark" style="width: 100%"><i class="fa fa-search"></i></button></div>
    </div>
</form>
@section('mudarBairros')
    <script src="{{asset('assets/js/city-and-neighborhoods.js')}}"></script>
    <script>
        $("#city").change(function(){
            const baseUrl = `<?= env('APP_URL') ?>`;
            mudarBairros(baseUrl);
        });
    </script>
@endsection
