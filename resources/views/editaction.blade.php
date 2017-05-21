@extends('layouts.app')

@section('content')



    <div class="container">

        <div class="row mt-4 p-3 bg-faded action">
            <div class="col-md-4">
                <img src="{{url('exports/178154.png')}}" class="rounded-circle"/>
            </div>
            <div class="col-md-8">
                <form action="{{ url('/edit/'.$action->id) }}" method="post">
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Ime akcije:</label>
                        <div class="col-12">
                            <input class="form-control" type="text" name='title' value="{{$action->title}}"
                                   id="example-text-input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleTextarea">Opis:</label>
                        <textarea class="form-control" id="exampleTextarea" name='info'
                                  rows="3">{{$action->info}}</textarea>
                    </div>
                    <div class="form-group">
                        <label>Vrsta Akcije:</label>
                        <select class="form-control">
                            <option>Planine</option>
                            <option>More</option>
                            <option>Stijene</option>
                            <option>Rijeka</option>
                        </select>
                        </label>
                    </div>
                    <label for="example-text-input" class="col-form-label">Početak akcije:</label>
                    <div class="col-12">
                        <input class="form-control" type="text" name='start_time' value="{{$action->start_time}}"
                               id="example-text-input">
                    </div>

                    <label for="example-text-input" class="col-form-label">Kraj akcije:</label>
                    <div class="col-12">
                        <input class="form-control" type="text" name='end_time'
                               value="@if(!isset($action->end_time))Akcija još u tijeku !@endif{{$action->end_time}}"
                               id="example-text-input">
                    </div>

                    <button type="submit" class="btn btn-success float-right">Spremi</button>
                    <button type="button" class="btn btn-link pull-right text-danger">
                        <small>Odustani</small>
                    </button>
                </form>
            </div>
        </div>


    </div>





@endsection