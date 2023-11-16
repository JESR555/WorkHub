<?php
if(isset($_POST["register"])) {
   $no_control = $_POST["no_control"];
   $first_name = $_POST["first_name"];
   $last_name = $_POST["last_name"];
   $email = $_POST["email"];

   $foto = $_FILES['foto']['tmp_name'];
   $foto_name = $_FILES['foto']['name'];
   $foto = base64_encode(file_get_contents(addslashes($foto)));

   $password = $_POST["password"];
   $confirm_password = $_POST["confirm_password"];
   $major = $_POST["major"];
   $phone = $_POST["phone"];

   $duplicate = mysqli_query($conn, "SELECT nombre, correo FROM user_estudiante WHERE nombre = '$first_name' OR correo = '$email'");
   if(mysqli_num_rows($duplicate) > 0) {
        echo 
        "<script> alert('El nombre o el correo ya han sido utilizados')</script>";
   } else {
        if($password == $confirm_password) {
            $query = "INSERT INTO user_estudiante(no_control, nombre, apellido, correo, contraseña, foto, telefono, id_carrera, id_rol) values('$no_control','$first_name','$last_name','$email', '$password', '$foto', $phone, '$major', 0)";
            mysqli_query($conn, $query);
            echo "<script> alert('Registro exitoso!!')</script>";
         } else {
         echo "<script> alert('Las contraseñas no coinciden')</script>";
      }
   }

}
function displayImage() {
   global $conn;
   $sql = "SELECT foto FROM user_estudiante";
   $data = mysqli_query($conn, $sql);
    while($row = mysqli_fetch_assoc($data)) {
      echo '<img src=data:image;base64,'.$row['foto'].' alt="profilepic"/>';
   }
}