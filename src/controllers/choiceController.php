<?php
namespace Dsw\Fct\Controllers;

require_once('../src/connection.php');

use Dsw\Fct\models\Choice;
use Dsw\Fct\models\User;
use Dsw\Fct\models\Company;

class choiceController
{
    public function index() {
        $rawChoices = Choice::all();
        $choices = [];
        foreach($rawChoices as $rawChoice) {
            $user = User::find($rawChoice->user_id);
            $company = Company::find($rawChoice->company_id);
            $choices[] = [
                'user'=> $user->name,
                'company'=>$company->name,
            ];
        }  
        if (isset($_GET['order'])) {
            $users = array_column($choices, 'user');
            $companies = array_column($choices, 'company');
            if ($_GET['order']=='user') {
                array_multisort($users, SORT_ASC, $companies, SORT_ASC, $choices);
            } else {
                array_multisort($companies, SORT_ASC, $users, SORT_ASC, $choices);
            }
        }

        global $blade;    
        echo $blade->view()->make('choice.list', compact('choices'))->render();
    }
}