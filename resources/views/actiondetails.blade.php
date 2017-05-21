@extends('layouts.app')

@section('content')

        <!-- MAP -->
        <div id="map-canvas"></div>

        <!-- CONTENT -->
        <div class="container">
            <div class="col-md-8 offset-2">
                <div class="row m-0 bg-faded action-details">
                    <div class="col-md-8 mt-4 p-4 col-md-divider-right">
                        <h4>{{$action->title }}</h4>
                        <hr>
                       <p >{{$type->about}}</p>
                        <p class="text-muted mt-2">{{$action->info}}</p>
                    </div>
                    <div class="col-md-4 bg-featured text-center">
                        <img src="{{url('profile-pic.jpg')}}" class="rounded-circle mt-5" />
                        <h6 class="mt-4">{{$user->first_name}} {{$user->last_name}}</h6>
                        <h6>Speleolog</h6>
                        <div class="mt-3">
                            <a href="#"><i class="fa fa-2x fa-phone-square" aria-hidden="true"> </i></a>
                            <a href="#"><i class="fa fa-2x fa-envelope" aria-hidden="true"> </i></a>
                        </div>

                    </div>
                </div>
            </div>
        </div>


@endsection