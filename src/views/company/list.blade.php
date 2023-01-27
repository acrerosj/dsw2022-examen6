@extends('master')

@section('title', 'Listado de Empresas')

@section('content')
<a href="/company/create" class="btn btn-primary">Crear empresa</a>
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nombre</th>
      <th scope="col">Modalidad</th>
      <th scope="col">Descripción</th>
      <th scope="col">Acciones</th>
    </tr>
  </thead>
  <tbody>
    @foreach ($companies as $company)
      <tr>
        <th scope="row">{{$company->id}}</th>
        <td>
          <a href="{{$company->url}}">
            {{$company->name}}
          </a>
        </td>
        <td>{{$company->mode}}</td>
        <td>{{$company->description}}</td>
        <td>
          @if ($_SESSION['profesor'])
            <a href="/company/{{$company->id}}" class="btn btn-primary">Editar</a>
            <form action="/company/{{$company->id}}" method="POST">
              <input type="hidden" name="_METHOD" value="DELETE">
              <input type="submit" class="btn btn-danger" value="borrar">
            </form>              
          @else
            @if ($company->chosen)
              <a href="/company/{{$company->id}}/unchoice" class="btn btn-warning">Desmarcar</a>                              
            @else
              @if ($count_choise<3)
                <a href="/company/{{$company->id}}/choice" class="btn btn-success">Elegir</a>                
              @else
                Desmarca alguna                  
              @endif
            @endif
          @endif
        </td>
      </tr>        
    @endforeach
  </tbody>
</table>
@endsection