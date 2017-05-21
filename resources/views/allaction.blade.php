@extends('layouts.app')

@section('content')
    <div class="container">

    @foreach($actions as $action)

    {{--<h1>{{$action->title}}</h1>--}}
    {{--<p>{{$action->info}}</p>--}}
    {{--<p>{{$action->start_time}}</p>--}}
    {{--<p>{{$action->end_time}}</p>--}}

            <div class="row mt-4 p-3 bg-faded action">
                <div class="col-md-4">
                    <img src="{{url('exports/178154.png')}}" class="rounded-circle" />
                </div>
                <div class="col-md-8 mt-4">
                    <h2>{{$action->title}}</h2>
                    <p class="mt-3 text-muted">{{$action->info}}</p>
                    <button type="button" class="btn btn-outline-primary float-right"><a href="{{url('akcija/'.$action->id)}} ">Detalji</a></button>
                    <button type="button" class="btn btn-link pull-right text-muted"><small><a href="{{url('edit/'.$action->id)}} ">Izmjeni</a></small></button>
                </div>
            </div>

@endforeach


</div>





    {{--<!-- CONTENT -->--}}
    {{--<div class="container">--}}

        {{--<div class="row mt-4 p-3 bg-faded action">--}}
            {{--<div class="col-md-4">--}}
                {{--<img src="//placehold.it/250" class="rounded-circle" />--}}
            {{--</div>--}}
            {{--<div class="col-md-8 mt-4">--}}
                {{--<h2>Spasavanje speleologa u Lukinoj jami</h2>--}}
                {{--<p class="mt-3 text-muted">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>--}}
                {{--<button type="button" class="btn btn-outline-primary float-right">Detalji</button>--}}
                {{--<button type="button" class="btn btn-link pull-right text-muted"><small>Izmjena</small></button>--}}
            {{--</div>--}}
        {{--</div>--}}

        {{--<div class="row mt-4 p-3 bg-faded action">--}}
            {{--<div class="col-md-4">--}}
                {{--<img src="//placehold.it/250" class="rounded-circle" />--}}
            {{--</div>--}}
            {{--<div class="col-md-8 mt-4">--}}
                {{--<h2>Potraga za izgubljenim djetetom na Sljemenu</h2>--}}
                {{--<p class="mt-3 text-muted">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>--}}
                {{--<button type="button" class="btn btn-outline-primary pull-right">Detalji</button>--}}
                {{--<button type="button" class="btn btn-link pull-right text-muted"><small>Izmjena</small></button>--}}
            {{--</div>--}}
        {{--</div>--}}


@endsection