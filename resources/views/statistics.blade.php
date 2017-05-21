@extends('layouts.app2')

@section('content')

    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">


    <div class="container mt-5">
        <h2 class="lead">Broj Akcija po godini</h2>
        <div id="myfirstchart" style="height: 250px;"></div>
        <br><br><br>
        <h2 class="lead">Statistika Članova HGSS-a</h2>
        <div class="row m-3">
            <div class="col-md-4"><div id="pie-chart"></div></div>
            <div class="col-md-4"><div id="pie-chart3"></div></div>
            <div class="col-md-4"><div id="pie-chart2"></div></div>
        </div>

    </div>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

    <script>

        new Morris.Line({
            // ID of the element in which to draw the chart.
            element: 'myfirstchart',
            // Chart data records -- each entry in this array corresponds to a point on
            // the chart.
            data: [
                {year: '2013', value: 5},
                {year: '2014', value: 8},
                {year: '2015', value: 7},
                {year: '2016', value: 10},
                {year: '2017', value: 15}
            ],
            // The name of the data record attribute that contains x-values.
            xkey: 'year',
            // A list of names of data record attributes that contain y-values.
            ykeys: ['value'],
            // Labels for the ykeys -- will be displayed when you hover over the
            // chart.
            labels: ['Value']
        });

    </script>
    <script>
        Morris.Donut({
            element: 'pie-chart',
            data: [
                {label: "{{\App\Role::find(1)->role_name}}", value: 30},
                {label: "{{\App\Role::find(4)->role_name}}", value: 15},
                {label: "{{\App\Role::find(5)->role_name}}", value: 45},
                {label: "{{\App\Role::find(6)->role_name}}", value: 10}
            ],
            colors:['#354666','#F7be15']
        });

    </script>
    <script>
        Morris.Donut({
            element: 'pie-chart2',
            data: [
                {label: "Zene", value: 30},
                {label: "Muskarci", value: 70}
            ],
            colors:['#da3432','#119ad6'],
        });

    </script>
    <script>
        Morris.Donut({
            element: 'pie-chart3',
            data: [
                {label: "Speleolozi", value: 30},
                {label: "Alpinisti", value: 40},
                {label: "Doktori", value: 15},


            ],
            colors:['#f55600','#82c91e','#5c7cfa'],
        });

    </script>



@endsection