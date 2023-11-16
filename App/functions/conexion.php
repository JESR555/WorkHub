<?php
$servidor  = "127.0.0.1:33065";
$nombre = "workhub";
$contra = "12345";
$dbnombre = "workhub";

//crear variable para la conexión
$conn = mysqli_connect($servidor, $nombre, $contra, $dbnombre);

if(mysqli_connect_errno()) {
   exit();
} else {
}
?>