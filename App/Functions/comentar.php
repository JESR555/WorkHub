<?php
$serverName = "127.0.0.1:33065";
$userName = "found_it";
$password = "123";
$dbName = "found_it";

$conn = mysqli_connect($serverName, $userName, $password, $dbName);

if(isset($_POST["comentar"])) {

   if(isset($_GET['id_autor'])) {
      $id_autor = $_GET['id_autor'];
   }
   
   if(isset($_GET['id_post'])) {
      $id_post = $_GET['id_post'];
   }
   
   $fecha_publicacion = date('Y-m-d H:i:s');
   $comentario = $_POST["comentario"];

   $queryComentario = "INSERT INTO comentarios_publicacion_estudiante(id_autor, contenido, fecha_publicacion,id_post) values($id_autor, '$comentario','$fecha_publicacion', $id_post)";
   mysqli_query($conn, $queryComentario);
   
}

header("Location: ../detailobject.php?id=".$id_post);