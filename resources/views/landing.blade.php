<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title></title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="dist/css/bootstrap.css">
    <!-- custom CSS -->
    <link rel="stylesheet" href="dist/css/custom-style.css">
  </head>
  <body>

  <div class="landing-video">
    <div class="overlay">
      <div class="container">
        <div class="logo text-center">
          <a href="{{url('akcije')}}">
            <img src="img/logo.svg" alt="">
          </a>
        </div>
      </div>
      <!-- BUTTON -->
      <div class="row mt-5">
        <div class="col-md-6 offset-md-3 text-center">
          <div class="welcome-txt d-block">
            <span class="display-4">Budi i ti dio naše priče <a class="text-accent" href="https://twitter.com/HrvatskaGSS?lang=en" target="_blank">#HGSS</a></span>
            <p class="lead"><em>"Prirodi smo svi jednaki. Kad krene pokazivati svoju snagu, poprilično je jasna u tome."</em></p>
          </div><br>
          <button type="button" class="btn btn-primary btn-action btn-lg"><a href="{{url('akcije')}}">Popis akcija</a></button>
        </div>
      </div>
    </div>
    <!-- VIDEO -->
    <video width="100%" height="100%" poster="/img/Rescue-poster.png" autoplay loop muted>
      <source src="Rescue.mp4" type="video/mp4">
      Your browser does not support the video tag.
    </video>
  </div>

  <!-- jQuery first, then Tether, then Bootstrap JS. -->
  <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
  <script src="dist/js/bootstrap.js"></script>
  </body>
</html>
