@section('noUiSliderCss')
    <link rel="stylesheet" href="{{asset('assets/vendor/noUiSLider/dist/nouislider.min.css')}}">
@endsection
<div class="row masthead__bg_search_form mt-5 mx-lg-0 mx-1">
    <form action="{{route('buscar')}}" method="POST">
        @csrf
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-12 mb-lg-0 mt-lg-5">
                <div class="form-group">
                    <input type="text" name="search" class="form-control form-control__white_border masthead__input_text" placeholder="Escreva o que procura aqui...">
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 mb-lg-0 mt-lg-5 mt-sm-2">
                <select id="city" name="city" class="form-select form-select__white_border masthead__input_select">
                    <option class="masthead__input_option" value="">Cidade</option>
                    @foreach($cities ?? [] as $item)
                    <option class="masthead__input_option" value="{{$item->id}}">{{$item->title}}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 mb-lg-0 mt-lg-5 mt-sm-2">
                <select id="neighborhood" name="neighborhood" class="form-select form-select__white_border masthead__input_select">
                    <option value="">Bairro</option>
                </select>
            </div>
        </div>
        <div class="row mt-1 justify-content-center">
            <div class="col-lg-6 col-md-6 col-sm-12 mb-lg-0 mb-lg-1 my-3 text-center">
                <span id="rangeValueMin" class="text-center"></span> - <span id="rangeValueMax"></span>
            </div>
        </div>
        <div class="row mt-1 justify-content-center">
            <div class="col-lg-6 col-md-6 col-sm-12 mb-lg-0 mb-lg-1 my-1">
                <div id="noUiSlider" class="my-2"></div><br>
                <input type="hidden" name="min" value="{{$menorPreco}}" id="min">
                <input type="hidden" name="max" value="{{$maiorPreco}}" id="max">
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-4 col-md-4 col-sm-12 mb-lg-0 mt-1">
                <button type="submit" class="btn btn-lg text-bg-dark" style="width: 100%"><i class="fa fa-search"></i></button>
            </div>
        </div>
    </form>
</div>
@section('mudarBairros')
    <script src="{{asset('assets/js/city-and-neighborhoods.js')}}"></script>
    <script src="{{asset('assets/js/jquery.maskMoney.min.js')}}"></script>
    <script>
        $("#city").change(function(){
            const baseUrl = `<?= env('APP_URL') ?>`;
            mudarBairros(baseUrl);
        });
    </script>
@endsection
@section('noUiSliderJs')
    <script src="{{asset('assets/vendor/noUiSLider/dist/nouislider.min.js')}}"></script>
    <script>
        $(document).ready(function() {
            var mySlider = document.getElementById('noUiSlider');
            var minValue = document.getElementById('rangeValueMin');
            var maxValue = document.getElementById('rangeValueMax');
            var minInput = document.getElementById('min');
            var maxInput = document.getElementById('max');

            minValue.textContent = {{$menorPreco}};
            maxValue.textContent = {{$maiorPreco}};
            minInput.value = {{$menorPreco}};
            maxInput.value = {{$maiorPreco}};

            noUiSlider.create(mySlider, {
                start: [{{$menorPreco}}, {{$maiorPreco}}],
                range: {
                    'min': [{{$menorPreco}}],
                    'max': [{{$maiorPreco}}]
                }
            });

            mySlider.noUiSlider.on('update', function(values, handle) {
                if (handle === 0) {
                    minValue.textContent = formatarMoeda(values[handle]);
                    minInput.value = values[handle];
                } else if (handle === 1) {
                    maxValue.textContent = formatarMoeda(values[handle]);
                    maxInput.value = values[handle];
                }
            });
        });
        function formatarMoeda(valor) {
            return parseFloat(valor).toLocaleString('pt-BR', {
                style: 'currency',
                currency: 'BRL'
            });
        }
    </script>
@endsection
