@extends('layouts.app')

@section('content')
    <div class="container">

    <table class="table table-striped mt-5">
    <thead class="thead-inverse">
    <tr>
        <th>Ime</th>
        <th>Prezime</th>
        <th>Telefon</th>
        <th>HGSS stanica</th>
        <th>Raspoloživost</th>
        <th>Uredi</th>
    </tr>
    </thead>
    <tbody>
    <tr>
    @foreach($spasitelji as $spasitelj)
    <tr>
        <td>{{$spasitelj->first_name}}</td>
        <td>{{$spasitelj->last_name}}</td>
        <td>{{$spasitelj->phone}}</td>
        <td>{{$spasitelj->station->name}}</td>
        <td>@foreach($spasitelj->timesheets as $timesheet){{$timesheet->description}} {{substr($timesheet->start_time,11,5)}} - {{substr($timesheet->end_time,11,5)}} <br>   @endforeach</td>
        <td><a href="/spasitelj/{{$spasitelj->id}}">Edit</td>



    </tr>

    @endforeach

</table>

    </div>
    @endsection