<?php
require 'funciones/conectar.php';
require 'funciones/registrarse_estudiante.php';
require 'funciones/entrar.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Maquetación/CSS/normalizacion.css">
    <link rel="stylesheet" href="/Maquetación/CSS/index.css">
<script>
    function redirectToRegistrarseEstudiante() {
        window.location.href = "/WorkHub/WorkHub/App/formulario_reg_estudiante.php";
    }
</script>
    <title>Workhub</title>
    <body>
<nav class="navbar navbar-expand-lg navbar-light bg-light py-3">
        <div class="container"><a href="#" class="navbar-brand d-flex align-items-center"> <i class="fa fa-snowflake-o fa-lg text-primary mr-2"></i><strong><img src="/Maquetación/assets/images/WorkHub.svg" alt="" class="img-fluid" width="40%"></strong></a>
          <button type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler"><span class="navbar-toggler-icon"></span></button>
          <div id="navbarSupportedContent" class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active"><a href="#" class="nav-link font-italic">Entrar</a></li>
              <li class="nav-item active"><a href="#" onclick="redirectToRegistrarseEstudiante()" class="nav-link font-italic">Registrarse</a></li>
              <li class="nav-item active"><a href="#" class="nav-link font-italic">Empleos</a></li>
              <li class="nav-item active"><a href="#" class="nav-link font-italic">Contactos</a></li>
            </ul>
          </div>
        </div>
      </nav>

      <div class="bg-light">
        <div class="container py-5">
          <div class="row h-100 align-items-center py-5">
            <div class="col-lg-6">
              <h1 class="display-4">Acerca de Nosotros</h1>
              <p class="lead text-muted mb-0">Encuentra empleo como estudiante, miles de oportunidades te esperan.</p>
            </div>
            <div class="col-lg-6 d-none d-lg-block"><img src="https://www.prisma.org.pe/wp-content/uploads/hombre-home-office.png" alt="" class="img-fluid"></div>
          </div>
        </div>
      </div>
      
      <div class="bg-white py-5">
        <div class="container py-5">
          <div class="row align-items-center mb-5">
            <div class="col-lg-6 order-2 order-lg-1"><i class="fa fa-bar-chart fa-2x mb-3 text-primary"></i>
              <h2 class="font-weight-light">Puedes darte a conocer</h2>
              <p class="font-italic text-muted mb-4">Publica tus habilidades y tus deseos de poder encontrar trabajo.</p><a href="#" class="btn btn-light px-5 rounded-pill shadow-sm">Comienza aquí</a>
            </div>
            <div class="col-lg-5 px-5 mx-auto order-1 order-lg-2"><img src="https://bootstrapious.com/i/snippets/sn-about/img-1.jpg" alt="" class="img-fluid mb-4 mb-lg-0"></div>
          </div>
          <div class="row align-items-center">
            <div class="col-lg-5 px-5 mx-auto"><img src="/Maquetación/assets/images/paypal.svg" alt="" class="img-fluid mb-4 mb-lg-0"></div>
            <div class="col-lg-6"><i class="fa fa-leaf fa-2x mb-3 text-primary"></i>
              <h2 class="font-weight-light">Empresas buscan a jóvenes promesas</h2>
              <p class="font-italic text-muted mb-4">Conecta con la empresa que sea de tu interés personal.</p><a href="#" class="btn btn-light px-5 rounded-pill shadow-sm">Comienza aquí</a>
            </div>
          </div>
        </div>
      </div>
      
      <div class="bg-light py-5">
        <div class="container py-5">
          <div class="row mb-4">
            <div class="col-lg-5">
              <h2 class="display-4 font-weight-light">Nuestro equipo</h2>
              <p class="font-italic text-muted">Proyecto de 6° Semestre de Ingeniería de Software.</p>
            </div>
          </div>
      
          <div class="row text-center">
            <!-- Team item-->
            <div class="col-xl-3 col-sm-6 mb-5">
              <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://bootstrapious.com/i/snippets/sn-about/avatar-1.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                <h5 class="mb-0">Jesús Sosa</h5><span class="small text-uppercase text-muted">El - Patrón</span>
                <ul class="social mb-0 list-inline mt-3">
                  <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-facebook-f"></i></a></li>
                  <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-twitter"></i></a></li>
                  <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-instagram"></i></a></li>
                  <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-linkedin"></i></a></li>
                </ul>
              </div>
            </div>
            <!-- End-->
      
            <!-- Team item-->
            <div class="col-xl-3 col-sm-6 mb-5">
              <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://bootstrapious.com/i/snippets/sn-about/avatar-3.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                <h5 class="mb-0">Brandón Vargas</h5><span class="small text-uppercase text-muted">Brandón - Chayanne</span>
                <ul class="social mb-0 list-inline mt-3">
                  <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-facebook-f"></i></a></li>
                  <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-twitter"></i></a></li>
                  <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-instagram"></i></a></li>
                  <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-linkedin"></i></a></li>
                </ul>
              </div>
            </div>
            <!-- End-->
      
            <!-- Team item-->
            <div class="col-xl-3 col-sm-6 mb-5">
              <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://bootstrapious.com/i/snippets/sn-about/avatar-2.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                <h5 class="mb-0">Jesús Sierra</h5><span class="small text-uppercase text-muted">El - Chalan</span>
                <ul class="social mb-0 list-inline mt-3">
                  <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-facebook-f"></i></a></li>
                  <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-twitter"></i></a></li>
                  <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-instagram"></i></a></li>
                  <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-linkedin"></i></a></li>
                </ul>
              </div>
            </div>
            <!-- End-->
      
          </div>
        </div>
      </div>
</body>