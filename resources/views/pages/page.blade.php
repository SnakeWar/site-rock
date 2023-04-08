@extends('pages.layouts.app')
@section('content')
    <div class="container">
        <div class="row p-5 justify-content-center">
            <div class="col-10">
                {!! $page->value !!}
            </div>
        </div>
    </div>
@endsection
