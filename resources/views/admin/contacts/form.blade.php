@extends('adminlte::page')
@section('title_prefix', env('APP_NAME') . ' - ')
@section('title', $subtitle)
@section('dropify')
    <link rel="stylesheet" href="{{asset('dropify/css/dropify.css')}}">
    <link rel="stylesheet" href="{{asset('dropify/fonts/dropify.ttf')}}">
@endsection
@section('content')
    <ol class="breadcrumb">
        <li><a href="{{ route('admin.home') }}" class="pr-1"><i class="fa fa-address-card"></i> Home /</a></li>
        <li><a href="{{ route($admin . '.index') }}" class="pr-1">{{ $title }} /</a></li>
        <li class="active"> {{ isset($model) ? 'Ver '.$subtitle : 'Adicionar '.$subtitle }}</li>
    </ol>
    <div class="card card-outline card-primary">
        <div class="card-header">
            <h1 class="card-title">{{$subtitle}}</h1>
        </div>
        <div class="card-body">
            <form action="{{ isset($model) ? route($admin . '.update', $model->id) : route($admin. '.store')}}" method="post" enctype="multipart/form-data">

                @csrf
                @if(!empty($model))
                    @method('PUT')
                @endif
                               <div class="form-group">
                    <label for="">Nome</label>
                    <input type="text" name="name" class="form-control @error('name') is-invalid @enderror"
                           value="{{ isset($model) ? $model->name : old('name') }}" disabled>
                    @error('name')
                    <div class="invalid-feedback">
                        {{$message}}
                    </div>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="">Telefone</label>
                    <input type="text" name="telephone" class="form-control @error('telephone') is-invalid @enderror"
                           value="{{ isset($model) ? $model->telephone : old('telephone') }}" disabled>
                    @error('telephone')
                    <div class="invalid-feedback">
                        {{$message}}
                    </div>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="">E-mail</label>
                    <input type="email" name="email" class="form-control @error('email') is-invalid @enderror"
                           value="{{ isset($model) ? $model->email : old('email') }}" disabled>
                    @error('email')
                    <div class="invalid-feedback">
                        {{$message}}
                    </div>
                    @enderror
                </div>
            </form>
            <a href="{{route($admin . '.index')}}" class="btn btn-block btn-lg btn-outline-primary">
                Voltar
            </a>
        </div>
    </div>

@endsection
