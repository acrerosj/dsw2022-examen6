<?php
require_once "../vendor/autoload.php";

session_start();

// Vistas

use Philo\Blade\Blade;

$views = '../src/views';
$cache = '../cache';

$blade = new Blade($views, $cache);

// Router system
$router = new AltoRouter();

// Change method PUT y DELETE
if (isset($_POST['_METHOD'])) {
  $_SERVER['REQUEST_METHOD'] = $_POST['_METHOD'];
}

// List of routes
$router->map('GET', '/', 'home');

$router->map('GET', '/login', 'login.login');
$router->map('POST', '/login', 'loginController#login');
$router->map('GET', '/logout', 'loginController#logout');

if (isset($_SESSION['id'])) {
 
}


// End of list

$match = $router->match();
if($match) {
  $target = $match["target"];
  if(is_string($target) && strpos($target, "#") !== false) {
      list($controller, $action) = explode("#", $target);
      $controller = "Dsw\\Fct\controllers\\" . $controller;
      $controller = new $controller;
      $controller->$action($match["params"]);
  } else {
      if(is_callable($match["target"])) call_user_func_array($match["target"], $match["params"]);
      else 
        echo $blade->view()->make($match["target"])->render();
  }
} else {
  echo "Ruta no válida";
  die();
}