@extends('master')

@section('title', 'Elección de los alumnos')

@section('content')
<table class="table">
  <thead>
    <tr>
      <th scope="col">
        <a href="/choice?order=user">Alumno</a>
      </th>
      <th scope="col">
        <a href="/choice?order=company">Empresa</a>
      </th>
    </tr>
  </thead>
  <tbody>
    @foreach ($choices as $choice)    
      <tr>
        <td>{{$choice['user']}}</td>
        <td>{{$choice['company']}}</td>
        </td>
      </tr>        
    @endforeach
  </tbody>
</table>
@endsection