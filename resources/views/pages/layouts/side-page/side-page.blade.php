<!-- Side widgets-->
<div class="col-lg-4 side-page">
    <!-- Search widget-->
{{--    <div class="card mb-4 shadow">--}}
{{--        <div class="card-body">--}}
{{--            <form action="{{route('buscar')}}" method="POST">--}}
{{--                @csrf--}}
{{--                <div class="form-group">--}}
{{--                    <input name="search" class="form-control" type="text" placeholder="Escreva o que procura aqui..." aria-label="Escreva o que procura aqui..." aria-describedby="button-search" />--}}
{{--                </div>--}}
{{--                <div class="d-grid gap-2 mt-1">--}}
{{--                    <button class="btn text-bg-dark btn-block" id="button-search" type="submit">Procurar</button>--}}
{{--                </div>--}}
{{--            </form>--}}
{{--        </div>--}}
{{--    </div>--}}
    <!-- Categories widget-->
{{--    <div class="card mb-4 shadow">--}}
{{--        <div class="card-header">Procurar por Cidade</div>--}}
{{--        <div class="card-body">--}}
{{--            <div class="row">--}}
{{--                @foreach($cities as $item)--}}
{{--                    <div class="col">--}}
{{--                        <a class="link-dark text-decoration-none" width="100%" href="{{route('buscar', ['city' => $item->id])}}">--}}
{{--                            <button class="btn btn-sm btn-outline-secondary mb-1">{{$item->title}}</button>--}}
{{--                        </a>--}}
{{--                    </div>--}}
{{--                @endforeach--}}
{{--            </div>--}}
{{--        </div>--}}
{{--    </div>--}}
    <div class="">
        <div class="card mb-4 shadow bg-white z-1" id="formFixo">
            <div class="card-header propriedade-oportunidade-preco-p">
                <div>Quero Saber Mais:</div>
                <small class="text-muted"><strong>R$</strong> {{number_format($post->valor, 2, ',', '.')}}</small>
            </div>
            <div class="card-body">
                @include('pages.layouts.form._form_contato')
            </div>
        </div>
    </div>
</div>
