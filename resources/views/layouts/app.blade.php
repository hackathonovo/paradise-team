<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">

<head>
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
    {{--<link href="{{ asset('css/app.css') }}" rel="stylesheet">--}}

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
    <input type="hidden" value="@if(isset($action->latitude)){{$action->latitude}}@endif" class="lat">
    <input type="hidden" value="@if(isset($action->longitude)){{$action->longitude}}@endif" class="lon">
    {{--<!-- Scripts -->--}}
    {{--<script src="{{ asset('js/app.js') }}"></script>--}}
    {{--<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>--}}
    {{--<script src="https://maps.googleapis.com/maps/api/js"></script>--}}
    {{--<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>--}}

    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyApFdfVI7xfynRYjzsnCfoCLRsMrG3AXdc"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="//maps.googleapis.com/maps/api/js?key=AIzaSyApFdfVI7xfynRYjzsnCfoCLRsMrG3AXdc&extension=.js&output=embed"></script>
    <script>
        jQuery(document).ready(function($) {
            $(document).ready(function() { /* google maps -----------------------------------------------------*/
                google.maps.event.addDomListener(window, 'load', initialize);

                function initialize() {
                    var lon = $(".lon").val();
                    var lat = $(".lat").val();


                    /* position Chicago */
                    var latlng = new google.maps.LatLng(lat, lon);
                    var mapOptions = {
                        zoomControl: true,
                        zoomControlOptions: {
                            position:
                            google.maps.ControlPosition.LEFT_TOP
                        },
                        center: latlng,
                        scrollwheel: false,
                        zoom: 13,
                        /* More styles at https://snazzymaps.com */
                        styles: [{
                            "featureType": "landscape",
                            "stylers": [{
                                "saturation": 20
                            }, {
                                "lightness": 65
                            }, {
                                "visibility": "on"
                            }]
                        }, {
                            "featureType": "poi",
                            "stylers": [{
                                "saturation": -100
                            }, {
                                "lightness": 51
                            }, {
                                "visibility": "simplified"
                            }]
                        }, {
                            "featureType": "road.highway",
                            "stylers": [{
                                "saturation": -100
                            }, {
                                "visibility": "simplified"
                            }]
                        }, {
                            "featureType": "road.arterial",
                            "stylers": [{
                                "saturation": -100
                            }, {
                                "lightness": 30
                            }, {
                                "visibility": "on"
                            }]
                        }, {
                            "featureType": "road.local",
                            "stylers": [{
                                "saturation": -100
                            }, {
                                "lightness": 40
                            }, {
                                "visibility": "on"
                            }]
                        }, {
                            "featureType": "transit",
                            "stylers": [{
                                "saturation": -100
                            }, {
                                "visibility": "simplified"
                            }]
                        }, {
                            "featureType": "administrative.province",
                            "stylers": [{
                                "visibility": "off"
                            }]
                        }, {
                            "featureType": "water",
                            "elementType": "labels",
                            "stylers": [{
                                "visibility": "on"
                            }, {
                                "lightness": -25
                            }, {
                                "saturation": -100
                            }]
                        }, {
                            "featureType": "water",
                            "elementType": "geometry",
                            "stylers": [{
                                "hue": "$background"
                            }, {
                                "lightness": -25
                            }, {
                                "saturation": -80
                            }]
                        }]

                        /* End Styles */
                    };

// Create our info window content
                    var infoWindowContent = '<div class="info_content">' +
                        '<h3>My Location</h3>' +
                        '<p>This is where you put information about this address</p>' +
                        '</div>';

                    // Initialise the inforWindow
                    var infoWindow = new google.maps.InfoWindow({
                        content: infoWindowContent
                    });

                    var marker = new google.maps.Marker({
                        position: latlng,
                        url: '/',
                        animation:
                        google.maps.Animation.DROP
                    });
                    // Display our info window when the marker is clicked
                    google.maps.event.addListener(marker, 'click', function() {
                        infoWindow.open(map, marker);
                    });

                    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
                    marker.setMap(map);
                };
                /* end google maps -----------------------------------------------------*/
            });
        });

    </script>
</body>
</html>
