@extends('adminlte::page')
@section('title_prefix', env('APP_NAME') . ' - ')
@section('title', $subtitle)
@section('adminlte_css')
    <link rel="stylesheet" href="{{ asset('datetimepicker\datetimepicker.min.css') }}">
    <link rel="stylesheet" href="{{asset('dropify/css/dropify.css')}}">
    <link rel="stylesheet" href="{{asset('dropify/fonts/dropify.ttf')}}">
    <link rel="stylesheet" href="{{asset('assets/css/select2.css')}}">
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
                            <label for="">Nome</label>
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
                                   value="{{ isset($model) ? $model->title : old('description') }}">
                            @error('description')
                            <div class="invalid-feedback">
                                {{$message}}
                            </div>
                            @enderror
                        </div>
                    </div>
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
                <form action="{{route('admin.city_neighborhood_add', $model->id)}}" method="post">
                    @csrf
                    <div class="row justify-content-center">
                        <div class="col-lg-6 col-md-12 col-sm-12">
                            <div class="form-group">
                                <label for="">Nome</label>
                                <input type="text" name="title" class="form-control @error('title') is-invalid @enderror">
                                @error('title')
                                <div class="invalid-feedback">
                                    {{$message}}
                                </div>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-lg-6 col-md-12 col-sm-12 align-baseline">
                            <div class="form-group">
                                <button type="submit" class="btn btn-block btn-primary">
                                    Adicionar Bairro a cidade
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
                    @foreach($model->neighborhoods ?? [] as $neighborhood)
                    <div class="row justify-content-center">
                        <div class="col-6">
                            <table class="table table-bordered table-striped data-table table-responsive-sm">
                                <tbody>
                                    <tr>
                                        <td class="text-left" width="50%">
                                            <h3 class="ml-1">{{$neighborhood->title}}</h3>
                                        </td>
                                        <td class="text-center" width="50%">
                                            <form action="{{route('admin.city_neighborhood_remove')}}" method="post">
                                                @csrf
                                                <input type="hidden" name="id" value="{{$neighborhood->id}}">
                                                <button type="submit" class="btn btn-sm btn-danger my-2"><i class="fa fa-trash"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    @endforeach
            </div>
        @endisset
    </div>
        </div>
    </div>

@endsection
@section('adminlte_js')
    <script src="{{asset('assets\vendor\jquery\jquery-3.5.1.min.js')}}"></script>
    <script src="{{asset('datetimepicker\datetimepicker.js')}}"></script>
    <script src="{{asset('dropify/js/dropify.js')}}"></script>
    <script src="{{asset('assets/js/select2.js')}}"></script>
    <script src="{{asset('assets/js/jquery.maskMoney.min.js')}}"></script>
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
