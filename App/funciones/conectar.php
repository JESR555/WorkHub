<?php
session_start();

$nombreservidor = "127.0.0.1:33065";
$usuario = "workhub";
$pass = "12345";
$nombrebd = "workhub";

//crear variable para la conexión
$conn = mysqli_connect($nombreservidor, $usuario, $pass, $nombrebd);

if(mysqli_connect_errno()) {
   exit();
} else {
}
?>