<?php
namespace Dsw\Fct\Controllers;

require_once('../src/connection.php');

use Dsw\Fct\models\Company;
use Dsw\Fct\models\Choice;

class companyController
{
  public function index() {
    if (isset($_POST['description'])) {
      $companies = Company::where('description', 'like', '%'.$_POST['description'].'%')->get();
    } else {
      $companies = Company::all();
    }
    $count_choise = 0;
    if (!$_SESSION['profesor']) {
      foreach($companies as $company) {
        $choice = Choice::where('company_id', $company->id)
          ->where('user_id', $_SESSION['id'])->first();
        if ($choice) {
          $company['chosen'] = 1;
          $count_choise++;
        }
        else $company['chosen'] = 0;
      }
    }
    global $blade;
    echo $blade->view()->make('company.list', compact('companies','count_choise'))->render();
  }

  public function edit($param)
  {
    $id = $param['id'];
    $company = Company::find($id);
    global $blade;
    echo $blade->view()->make('company.edit', compact('company'))->render();
  }

  public function store()
  {
    $company = new Company;
    $company->name = $_POST['name'];
    $company->url = $_POST['url'];
    $company->mode = $_POST['mode'];
    $company->description = $_POST['description'];
    $company->save();
    header('Location: /company');
  }

  public function update($params)
  {
    $id = $params['id'];
    $company = Company::find($id);
    $company->name = $_POST['name'];
    $company->url = $_POST['url'];
    $company->mode = $_POST['mode'];
    $company->description = $_POST['description'];
    $company->save();
    header('Location: /company');
  }

  public function destroy($params) {
    $id = $params['id'];
    $company = Company::find($id);
    $company->delete();
    header('Location: /company');
  }

  public function choice($params) {
    $id = $params['id'];
    $choice = new Choice;
    $choice->company_id = $id;
    $choice->user_id = $_SESSION['id'];
    $choice->save();
    header('Location: /company');
  }

  public function unchoice($params) {
    $id = $params['id'];
    $choice = Choice::where('user_id', $_SESSION['id'])
      ->where('company_id', $id)->first();
    $choice->delete();
    header('Location: /company');
  }
}