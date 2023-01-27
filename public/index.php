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
  $router->map('GET', '/company', 'companyController#index');
  if ($_SESSION['profesor']) {
    $router->map('GET', '/company/create', 'company.create');
    $router->map('GET', '/company/[i:id]/edit', 'companyController#edit');
    $router->map('POST', '/company', 'companyController#store');
    $router->map('PUT', '/company/[i:id]', 'companyController#update');
    $router->map('DELETE', '/company/[i:id]', 'companyController#destroy');
  } else {
    $router->map('GET', '/company/[i:id]/choice', 'companyController#choice');
    $router->map('GET', '/company/[i:id]/unchoice', 'companyController#unchoice');
  }
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