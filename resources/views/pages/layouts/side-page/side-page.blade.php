<!-- Side widgets-->
<div class="col-lg-4 side-page">
    <!-- Search widget-->
    <div class="card mb-4">
        <div class="card-header">Procurar</div>
        <hr class="mt-1">
        <div class="card-body">
            <form action="{{route('buscar')}}" method="POST">
                @csrf
                <div class="form-group">
                    <input name="search" class="form-control" type="text" placeholder="Escreva o que procura aqui..." aria-label="Escreva o que procura aqui..." aria-describedby="button-search" />
                </div>
                <div class="d-grid gap-2 mt-1">
                    <button class="btn text-bg-dark btn-block" id="button-search" type="button">Enviar</button>
                </div>
            </form>
        </div>
    </div>
    <!-- Categories widget-->
    <div class="card mb-4">
        <div class="card-header">Categorias / Tipo</div>
        <hr class="mt-1">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-6">
                    <ul class="list-unstyled mb-0">
                        @foreach($categories as $item)
                            <li><a class="link-dark text-decoration-none" href="{{route('buscar', ['category' => $item->id])}}">{{$item->title}}</a></li>
                        @endforeach
                    </ul>
                </div>
                <div class="col-sm-6">
                    <ul class="list-unstyled mb-0">
                        @foreach($tags as $item)
                            <li><a class="link-dark text-decoration-none" href="{{route('buscar', ['tag' => $item->id])}}">{{$item->title}}</a></li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Side widget-->
    <div class="card mb-4">
        <div class="card-header">Relacionados</div>
        <hr class="mt-1">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-6">
                    <ul class="list-unstyled mb-0">
                        @foreach($posts as $item)
                            <li class=""><a class="link-dark text-decoration-none" href="{{route('post', ['slug' => $item->slug])}}">{{$item->title}}</a></li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
