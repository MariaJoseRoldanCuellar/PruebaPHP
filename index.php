<h1>Bienvenido a mi Web</h1>

<?php
   
   require_once 'controllers/UsuarioController.php';

   $controlador=new UsuarioController();


   $controlador->mostrarTodos();
   
?>