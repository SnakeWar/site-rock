@extends('adminlte::page')
@section('title_prefix', env('APP_NAME') . ' - ')
@section('title', $subtitle)
@section('adminlte_css')
    <link rel="stylesheet" href="{{ asset('datetimepicker\datetimepicker.min.css') }}">
    <link rel="stylesheet" href="{{asset('dropify/css/dropify.css')}}">
    <link rel="stylesheet" href="{{asset('dropify/fonts/dropify.ttf')}}">
    <link rel="stylesheet" href="{{asset('assets/css/select2.css')}}">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
          integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
          crossorigin=""/>
    <style>
        .select2-container--default .select2-selection--multiple .select2-selection__choice {
            background-color: #007bff;
            border-color: #006fe6;
            color: #fff;
            padding: 0 10px;
            margin-top: 0.31rem;
        }
        .ck-editor__editable {
            min-height: 200px;
        }
    </style>
@endsection
@section('content')
    <ol class="breadcrumb">
        <li><a href="{{ route('admin.home') }}" class="pr-1"><i class="fa fa-address-card"></i> Home /</a></li>
        <li><a href="{{ route($admin . '.index') }}" class="pr-1">{{ $title }} /</a></li>
        <li class="active"> {{ isset($model) ? 'Editar '.$subtitle : 'Adicionar '.$subtitle }}</li>
    </ol>
    <div class="card card-outline card-primary">
        <div class="card-header">
            <h1 class="card-title">{{$subtitle}}</h1>
            @include('flash::message')
        </div>
        <div class="card-body">
            <form action="{{ isset($model) ? route($admin . '.update', $model->id) : route($admin. '.store')}}"
                  method="post" enctype="multipart/form-data">
                @csrf
                @if(!empty($model))
                    @method('PUT')
                @endif
                <div class="row">
                    <div class="col-lg-6 col-md-12 col-sm-12">
                        <div class="form-group">
                            <label for="">Título</label>
                            <input type="text" name="title" class="form-control @error('title') is-invalid @enderror"
                                   value="{{ isset($model) ? $model->title : old('title') }}">
                            @error('title')
                            <div class="invalid-feedback">
                                {{$message}}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12">
                        <div class="form-group">
                            <label for="">Descrição</label>
                            <input type="text" name="description"
                                   class="form-control @error('description') is-invalid @enderror"
                                   value="{{ isset($model) ? $model->description : old('description') }}">
                            @error('description')
                            <div class="invalid-feedback">
                                {{$message}}
                            </div>
                            @enderror
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-12">
                        <div class="form-group date">
                            <label for="">Data de Publicação</label>
                            <input type="text" name="published_at"
                                   class="datetimepicker form-control @error('published_at') is-invalid @enderror"
                                   value="{{ isset($model) ? Helper::convertdata_tosite($model->published_at) : old('published_at') }}">
                            @error('published_at')
                            <div class="invalid-feedback">
                                {{$message}}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="dormitorios">Qtd. dormitórios</label>
                            <input type="number" name="dormitorios"
                                   class="form-control @error('dormitorios') is-invalid @enderror"
                                   value="{{ isset($model) ? $model->dormitorios : old('dormitorios') }}">
                            @error('dormitorios')
                            <div class="invalid-feedback">
                                {{$message}}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="banheiros">Qtd. banheiros</label>
                            <input type="number" name="banheiros"
                                   class="form-control @error('banheiros') is-invalid @enderror"
                                   value="{{ isset($model) ? $model->banheiros : old('banheiros') }}">
                            @error('banheiros')
                            <div class="invalid-feedback">
                                {{$message}}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="vagas_garagem">Qtd. vagas de garagem</label>
                            <input type="number"
                                   name="vagas_garagem"
                                   class="form-control
                                   @error('vagas_garagem') is-invalid @enderror"
                                   value="{{ isset($model) ? $model->vagas_garagem :
                                   old('vagas_garagem') }}">
                            @error('vagas_garagem')
                            <div class="invalid-feedback">
                                {{$message}}
                            </div>
                            @enderror
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="metro_quadrado_total">Metro quadrado total</label>
                            <input type="text" name="metro_quadrado_total"
                                   class="form-control
                                   @error('metro_quadrado_total') is-invalid @enderror"
                                   value="{{ isset($model) ? $model->metro_quadrado_total :
                                   old('metro_quadrado_total') }}">
                            @error('metro_quadrado_total')
                            <div class="invalid-feedback">
                                {{$message}}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="metro_quadrado_privado">Metro quadrado privado</label>
                            <input type="text"
                                   name="metro_quadrado_privado"
                                   class="form-control
                                   @error('metro_quadrado_privado') is-invalid @enderror"
                                   value="{{ isset($model) ? $model->metro_quadrado_privado :
                                   old('metro_quadrado_privado') }}">
                            @error('metro_quadrado_privado')
                            <div class="invalid-feedback">
                                {{$message}}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="valor">Valor</label>
                            <input type="text" name="valor"
                                   id="price"
                                   class="form-control @error('valor') is-invalid @enderror"
                                   value="{{ isset($model) ? 'R$ ' . number_format($model->valor, 2, ',', '.') :
                                   old('valor') }}">
                            @error('valor')
                            <div class="invalid-feedback">
                                {{$message}}
                            </div>
                            @enderror
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="categories">Categorias</label>
                            <select name="categories[]" class="form-control multiple-select" multiple>
                                @foreach($categories as $category)
                                    <option
                                        value="{{$category->id}}" {{ isset($model) ? (($model->categories->contains($category)) ? 'selected' : '') : '' }}>{{$category->title}}</option>
                                    {{$category->id}}|{{$category->title}}
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="tags">Tags</label>
                            <select name="tags[]" class="form-control multiple-select" multiple>
                                @foreach($tags as $tag)
                                    <option
                                        value="{{$tag->id}}" {{ isset($model) ? (($model->tags->contains($tag)) ? 'selected' : '') : '' }}>{{$tag->title}}</option>
                                    {{$tag->id}}|{{$tag->title}}
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="categories">Cidade</label>
                            <select id="city" name="city_id" class="form-control">
                                @foreach($cities as $item)
                                    <option
                                        value="{{$item->id}}" {{ isset($model) ? (($model->city_id == $item->id) ? 'selected' : '') : '' }}>{{$item->title}}</option>
                                    {{$item->id}}|{{$item->title}}
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="tags">Bairro</label>
                            <select id="neighborhood" name="city_neighborhoods_id" class="form-control" >
                                @isset($model)
                                    @foreach($cityNeighborhoods as $item)
                                        <option
                                            value="{{$item->id}}" {{ isset($model) ? (($model->city_neighborhoods_id == $item->id) ? 'selected' : '') : '' }}>{{$item->title}}</option>
                                        {{$item->id}}|{{$item->title}}
                                    @endforeach
                                @endisset
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="">Conteúdo</label>
                    <textarea type="text" id="editor" name="body" cols="30" rows="10"
                              class="form-control @error('body') is-invalid @enderror">{{ isset($model) ? $model->body : old('body') }}</textarea>
                    @error('body')
                    <div class="invalid-feedback">
                        {{$message}}
                    </div>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="">Foto</label>
                    <input type="file" class="dropify form-control @error('photo') is-invalid @enderror" name="photo">
                    @error('photo')
                    <div class="invalid-feedback">
                        {{$message}}
                    </div>
                    @enderror
                    @if(isset($model->photo))
                        <div class="box-body mt-3 col-lg-3 col-md-6 col-sm-12">
                            <img class="img-panel img-thumbnail w-100" src="{{ asset("storage/$model->photo") }}"
                                 alt="{{ $model->title }}">
                        </div>
                    @endif
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="latitude">Latitude</label>
                            <input type="text"
                                   name="latitude"
                                   id="latitude"
                                   class="form-control
                                   @error('latitude') is-invalid @enderror"
                                   value="{{ isset($model) ? $model->latitude :
                                   old('latitude') }}">
                            @error('latitude')
                            <div class="invalid-feedback">
                                {{$message}}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="longitude">Longitude</label>
                            <input type="text"
                                   name="longitude"
                                   id="longitude"
                                   class="form-control
                                   @error('longitude') is-invalid @enderror"
                                   value="{{ isset($model) ? $model->longitude :
                                   old('longitude') }}">
                            @error('longitude')
                            <div class="invalid-feedback">
                                {{$message}}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 mb-5">
                        <div id="map" style="height: 500px;width: 100%">
                            {{--                    Carrega mapa aqui--}}
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-block btn-lg btn-primary">
                        {{ isset($model) ? 'Atualizar '.$subtitle : 'Criar '.$subtitle }}
                    </button>
                </div>
            </form>
        </div>
        @isset($model)
            <div class="card-footer">
                <hr>
                <form action="{{route('admin.post_photo_add', $model->id)}}" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="photosAdd">Galeria</span>
                        </div>
                        <div class="custom-file">
                            <input type="file" name="photos[]" class="custom-file-input @error('photo') is-invalid @enderror" id="photos" aria-describedby="photosAdd" multiple>
                            <label class="custom-file-label" for="photos">Escolha suas fotos</label>
                        </div>
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-outline-primary" id="inputGroupFileAddon04">Enviar Fotos</button>
                        </div>
                    </div>
                </form>
                <div class="row">
                    @foreach($model->photos as $photo)
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <form action="{{route('admin.post_photo_remove')}}" method="post">
                                @csrf
                                <input type="hidden" name="photoName" value="{{$photo->photo}}">
                                <button type="submit" class="btn btn-sm btn-danger my-2"><i class="fa fa-trash"></i></button>
                            </form>
                            <img src="{{asset('storage/' . $photo->photo)}}" alt="" class="img-thumbnail">
                        </div>
                    @endforeach
                </div>
            </div>
        @endisset
    </div>
@endsection
@section('adminlte_js')
    <script src="{{asset('assets\vendor\jquery\jquery-3.5.1.min.js')}}"></script>
    <script src="{{asset('datetimepicker\datetimepicker.js')}}"></script>
    <script src="{{asset('dropify/js/dropify.js')}}"></script>
    <script src="{{asset('assets/js/select2.js')}}"></script>
    <script src="{{asset('assets/js/jquery.maskMoney.min.js')}}"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/super-build/ckeditor.js"></script>
    <script src="{{asset('assets/js/ckeditor-menu.js')}}"></script>
    <script src="{{asset('assets/js/city-and-neighborhoods.js')}}"></script>
    <!-- Make sure you put this AFTER Leaflet's CSS -->
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
            integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
            crossorigin="">
    </script>
    <script>
        var map;
        var marker;
        carregarMapa({{$model->latitude}}, {{$model->longitude}}, "{{$model->title}}", "{{$model->description}}");
        function carregarMapa (lat, long, title, description) {
            map = L.map('map').setView([lat, long], 13);
            L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19,
                attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
            }).addTo(map);
            marker = L.marker([lat || 0, long || 0]).addTo(map);
            marker.bindPopup("<b>" + title || "" + "</b><br>" + description || "").openPopup();
        }
        function onMapClick(e) {
            var latitude = document.getElementById("latitude");
            var longitude = document.getElementById("longitude");
            //alert("Lat e Long: " + e.latlng.toString());
            var lat = e.latlng.lat;
            var long = e.latlng.lng;
            latitude.value = lat;
            longitude.value = long;
            marker.remove();
            marker = L.marker([lat, long]).addTo(map);
            marker.bindPopup("<b>{{$model->title}}</b><br>{{$model->description}}").openPopup();
        }

        map.on('click', onMapClick);
    </script>
    <script>
        $("#city").change(function(){
            const baseUrl = `<?= env('APP_URL') ?>`;
            mudarBairros(baseUrl);
        });
    </script>
    <script>
        $('div.alert').not('.alert-important').delay(3000).fadeOut(350);
    </script>
    <script>
        $('.dropify').dropify(
            {
                messages: {
                    'default': 'Arraste e solte aqui',
                    'replace': 'Arraste solte ou clique para modificar',
                    'remove': 'Remover',
                    'error': 'Ooops, Algo de errado aconteceu.'
                }
            }
        );
    </script>
    <script>
        jQuery.datetimepicker.setLocale('pt');
        $(document).ready(function () {
            $('.datetimepicker').datetimepicker(
                {
                    format: 'd/m/Y'
                }
            );
        });
    </script>
    <script>
        $(document).ready(function () {
            $('.multiple-select')
                .select2();
        });
    </script>
    <script>
        $('#price').maskMoney({
            prefix: 'R$ ',
            allowNegative: false,
            thousands: '.',
            decimal: ','
        })
    </script>

@stop
