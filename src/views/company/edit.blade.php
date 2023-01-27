@extends('master')

@section('title', 'Modificar empresa')

@section('content')
<h2>Datos de la empresa a modificar:</h2>
<form method="POST" action="/company/{{$company->id}}">
  <input type="hidden" name="_METHOD" value="PUT">
  <div class="mb-3">
    <label for="exampleInputName1" class="form-label">Nombre</label>
    <input type="text" class="form-control" id="exampleInputName1" name="name" value="{{$company->name}}">
  </div>
  <div class="mb-3">
    <label for="exampleInputURL1" class="form-label">Página Web</label>
    <input type="text" class="form-control" id="exampleInputURL1" name="url" value="{{$company->url}}">
  </div>
  <div class="mb-3">
    <div class="form-check">
      <input class="form-check-input" type="radio" name="mode" id="flexRadioDefault1" value='online' checked>
      <label class="form-check-label" for="flexRadioDefault1">
        On-line
      </label>
    </div>
    <div class="form-check">
      <input class="form-check-input" type="radio" name="mode" id="flexRadioDefault2" value='semipresencial'>
      <label class="form-check-label" for="flexRadioDefault2">
        Semipresencial
      </label>
    </div>
    <div class="form-check">
      <input class="form-check-input" type="radio" name="mode" id="flexRadioDefault3" value='presencial'>
      <label class="form-check-label" for="flexRadioDefault3">
        Presencial
      </label>
    </div>
  </div>
  <div class="mb-3">
    <label for="exampleInputDescription1" class="form-label">Descripción</label>
    <input type="text" class="form-control" id="exampleInputDescription1" name="description" value="{{$company->description}}">
  </div>

  <button type="submit" class="btn btn-primary">Modificar</button>
</form>
@endsection