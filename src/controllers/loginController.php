<?php
namespace Dsw\Fct\Controllers;

require_once('../src/connection.php');

use Dsw\Fct\models\User;

class loginController
{
  public function login() {
    $user = User::where([
      ['name', $_POST['name']],
      ['password', $_POST['password']]
    ])->first();
    if ($user) {
      $_SESSION['id'] = $user->id;
      $_SESSION['name'] = $user->name;
      header('Location: /');
    } else {
      header('Location: /login');  
    }
  }

  public function logout() {
    session_destroy();
    header('Location: /');
  }
}