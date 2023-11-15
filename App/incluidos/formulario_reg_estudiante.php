<?php
require 'funciones/conectar.php';
if (isset($_POST['register'])) {
    // Sanitización de datos
    $no_control = isset($_POST['no_control']) ? htmlspecialchars($_POST['no_control']) : '';
    $first_name = isset($_POST['first_name']) ? htmlspecialchars($_POST['first_name']) : '';
    $last_name = isset($_POST['last_name']) ? htmlspecialchars($_POST['last_name']) : '';
    $email = isset($_POST['email']) ? htmlspecialchars($_POST['email']) : '';
    $major = isset($_POST['major']) ? htmlspecialchars($_POST['major']) : '';
    $phone = isset($_POST['phone']) ? htmlspecialchars($_POST['phone']) : '';
    
    $stmt = $conn->prepare('INSERT INTO usuarios (no_control, first_name, last_name, email, major, phone) VALUES (?, ?, ?, ?, ?, ?)');
    $stmt->execute([$no_control, $first_name, $last_name, $email, $major, $phone]);
}
?>

<form class="registration-form movLR" method="POST" enctype="multipart/form-data">
    <h2 class="register-titulo">Registrate</h2>
    
    <div class="form-group">
        <input type="text" id="no_control" name="no_control" placeholder="Número de control (solo los números)" required>
    </div>

    <div class="form-group">
        <input type="text" id="first_name" name="first_name" placeholder="Nombres" required>
    </div>
    
    <div class="form-group">
        <input type="text" id="last_name" name="last_name" placeholder="Apellidos" required>
    </div>
    
    <div class="form-group">
        <input type="email" id="email" name="email" placeholder="Correo" required>
    </div>

    <div class="form-group">
        <input type="file" id="foto" name="foto" style="display:block;margin:0 auto;font-size:15px;">
    </div>
    
    <div class="form-group password-group">
        <div class="password-wrapper">
        <input type="password" id="password" name="password" placeholder="Contraseña" required>
        <span class="password-toggle"></span>
        </div>
    </div>
    
    <div class="form-group password-group">
        <div class="password-wrapper">
        <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirmar contraseña" required>
        <span class="password-toggle"></span>
        </div>
    </div>
    
    <div class="form-group">
        <select id="major" name="major" type ="major">
            <option style="font-family:'Arial'" value="ISC">Sistemas Computacionales</option>
            <option style="font-family:'Arial'" value="INF">Informatica</option>
            <option style="font-family:'Arial'" value="ARQ">Arquitectura</option>
            <option style="font-family:'Arial'" value="IND">Industrial</option>
            <option style="font-family:'Arial'" value="IDIND">Diseño Industrial</option>
            <option style="font-family:'Arial'" value="IGE">Gestión Empresarial</option>
            <option style="font-family:'Arial'" value="ADMIN">Administración</option>
        </select>
    </div>
    
    <div class="form-group">
        <input type="text" id="phone" name="phone" placeholder="Número de teléfono" pattern="[0-9]+" title="Ingrese un número de teléfono válido" required >
    </div>
    
    <button type="submit" name="register" class="submit-button">Registrarse</button>
    <a class="cerrar" href=""><img src="assets/icons/equis.svg"></a>
</form>