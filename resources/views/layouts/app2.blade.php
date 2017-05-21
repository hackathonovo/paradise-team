<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">

<head>
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
{{--    <link href="{{ asset('css/app.css') }}" rel="stylesheet">--}}

    <!-- Scripts -->
    <script>
        window.Laravel = {!! json_encode([
            'csrfToken' => csrf_token(),
        ]) !!};
    </script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Spasioci</title>

    <!-- Font Awesome -->
    <script src="https://use.fontawesome.com/98a1849afa.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="{{url('dist/css/bootstrap.css')}}">
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,700" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="{{url('dist/css/custom-style.css')}}">
    <!-- Favicons -->
    <link rel="icon" type="image/png" href="{{url('img/favicon.png')}}">
</head>

<body>
    <div id="app">

        <!-- NAVIGATION -->
        <nav class="navbar navbar-toggleable-md navbar-light">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="container">
                <a class="navbar-brand" href="#"><img src="{{url('img/favicon.png')}}" width="30" height="30" alt=""></a>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                    <ul class="navbar-nav mr-auto mt-2 mt-md-0">
                        <li class="nav-item">
                            <a class="nav-link" href="{{url('akcije')}}">Akcije</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="{{url('spasitelji')}}">Administracija</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{url('sifrarnik')}}">Šifrarnik</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{url('statistika')}}">Statistika</a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>

        @yield('content')

    </div>

    <!-- Scripts -->
    {{--<script src="{{ asset('js/app.js') }}"></script>--}}
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>

<!-- jQuery first, then Tether, then Bootstrap JS. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="{{url('dist/js/bootstrap.js')}}"></script>
{{--<script src="{{url('dist/js/map.js')}}"></script>--}}
</body>
</html>
