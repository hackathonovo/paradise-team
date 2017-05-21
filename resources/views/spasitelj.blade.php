@extends('layouts.app')

@section('content')
    <div class="container mt-5">
        <div class="row m-0">
            <div class="col-md-9 offset-3">
                <form action="{{ url('/spasitelj/'.$spasitelj->id) }}" method="post">

                    <label>
                        <b>Ime</b>
                        <input class="form-control" name='first_name' type="text" value="{{$spasitelj->first_name}}">
                    </label>
                    <br>

                    <label>
                        <b>Prezime</b>
                        <input class="form-control" name='last_name' type="text" value="{{$spasitelj->last_name}}">
                    </label>
                    <br>

                    <label>
                        <b>Broj Telefona</b>
                        <input class="form-control" name='phone' type="tel" value="{{$spasitelj->phone}}">
                    </label>
                    <br>

                    <label>
                        <b>HGSS Stanica</b>
                        <select class="form-control">
                            <option>Zagreb</option>
                            <option>Split</option>
                            <option>Karlovac</option>
                            <option>Zadar</option>
                        </select>
                    </label>
                    <br>

                    <label>
                        <b>Slobodan od:</b>
                        <input name='start_time' class="form-control" type="time"
                               value="{{substr($timesheet->start_time,11,5)}}" id=“example-time-input”>
                    </label>
                    <br>

                    <label>
                        <b>Slobodan do:</b>
                        <input name='end_time' class="form-control" type="time"
                               value="{{substr($timesheet->end_time,11,5)}}" id=“example-time-input”>
                    </label>
                    <br>
                    <label>
                        <b>Opis lokacije </b>
                        <input class="form-control" name='description' type="text" value="{{$timesheet->description}}">
                    </label>
                    <input class="btn btn-success" type="submit" value="Potvrdi">
                </form>
            </div>
        </div>
    </div>
@endsection