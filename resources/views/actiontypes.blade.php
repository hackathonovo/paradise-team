@extends('layouts.app')

@section('content')
    <div class="container mt-5">

    <h1>Tipovi akcija</h1>
        <table class="table table-striped mt-5">
            <thead class="thead-inverse">
            <th>Ime</th>
            <th>Opis</th>
            <th>Obriši</th>
            </thead>

    @foreach($types as $type)

      <tr>
          <td>{{$type->name}}</td>
          <td>{{$type->about}}</td>
          <td><a href="/delete">Delete</a></td>
      </tr>
@endforeach
  </table>

    <form class="mt-4" action="{{url('/sifrarnik')}}" method="post">
        <label>
            <b>Ime</b>
            <input class="form-control" name='name' type="text" value="">
        </label>

        <label>
            <b>Opis</b>
            <input class="form-control" name='about' type="text" value="">
        </label>

        <label>
            <input class="form-control btn btn-success" name='' type="submit" value="Spremi u Šifrarnik">
        </label>


    </form>









    </div>


@endsection