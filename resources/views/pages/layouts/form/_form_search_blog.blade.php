<div class="row masthead__bg_search_form mt-5 mx-lg-0 mx-1">
    <form action="{{route('blog-buscar')}}" method="POST">
        @csrf
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-12 mb-lg-0 mt-lg-5">
                <div class="form-group">
                    <input type="text" name="search" class="form-control form-control__white_border masthead__input_text" placeholder="Escreva o que procura aqui...">
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 mb-lg-0 mt-lg-5 mt-sm-2">
                <select id="city" name="city" class="form-select form-select__white_border masthead__input_select">
                    <option class="masthead__input_option" value="">Categoria</option>
                    @foreach($categories ?? [] as $item)
                    <option class="masthead__input_option" value="{{$item->id}}">{{$item->title}}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 mb-lg-0 mt-lg-5 mt-sm-2">
                <select id="neighborhood" name="neighborhood" class="form-select form-select__white_border masthead__input_select">
                    <option class="masthead__input_option" value="">Tipo</option>
                    @foreach($types ?? [] as $item)
                        <option class="masthead__input_option" value="{{$item->id}}">{{$item->title}}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="row justify-content-center mt-3">
            <div class="col-lg-4 col-md-4 col-sm-12 mb-lg-0 mt-1">
                <button type="submit" class="btn btn-lg text-bg-dark" style="width: 100%"><i class="fa fa-search"></i></button>
            </div>
        </div>
    </form>
</div>
