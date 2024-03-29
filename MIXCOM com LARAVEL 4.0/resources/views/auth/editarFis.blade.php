@extends('layouts.app')
@section('pagina_conteudo')
<br><br>
<!--Inicio Form-->
<div class="container">
    <div class="row">
        <div class="col-12 text-center my-4">
            <h1 class="display-4 my-5"> {{ __('Edite seu perfil')}}</h1>
        </div>
    </div>
    <div class="row justify-content-center mb-5">
        <div class="col-sm-12 col-md-10 col-lg-8">
            <form method="POST" action="/editarFis/{{$user->id}}">
                @csrf
                <div class="form-row">
                    <div class="form-group col-sm-12">
                        <input id="name" type="text" placeholder="{{$user->name}}" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}"
                        name="name" value="{{ old('name') }}" required autofocus>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-sm-7">
                        <input id="cpf" type="text" placeholder="{{$userfis->cpf}}" class="form-control{{ $errors->has('cpf') ? ' is-invalid' : '' }}"
                        name="cpf" value="{{ old('cpf') }}" required autofocus>

                    </div>
                    <div class="form-group col-sm-5">
                        <input id="telefone" type="text" placeholder="{{$user->telefone}}" class="form-control{{ $errors->has('telefone') ? ' is-invalid' : '' }}"
                        name="telefone" value="{{ old('telefone') }}" required autofocus>

                    </div>
                </div>
            
                <div class="form-row">
                    <div class="form-group col-sm-6">
                        <input id="email" type="email" placeholder="{{$user->email}}" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}"
                        name="email" value="{{ old('email') }}" required>

                    </div>
                    <div class="form-grup col-sm-6">
                        <input id="email2" type="email2" placeholder="Confirme o seu Email" class="form-control{{ $errors->has('email2') ? ' is-invalid' : '' }}"
                        name="email2" value="{{ old('email2') }}" required>

                        @if ($errors->has('email2'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('email2') }}</strong>
                        </span>
                        @endif
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-sm-6">
                        <input id="password" type="password" placeholder="********" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}"
                        name="password" required>

                        @if ($errors->has('password'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('password') }}</strong>
                        </span>
                        @endif
                    </div>
                    <div class="form-group col-sm-6">
                        <input id="password-confirm" placeholder="********" type="password" class="form-control"
                        name="password_confirmation" required>
                    </div>
                </div>


                <div class="form-row">
                    <div class="form-group mr-auto ml-2">
                        <div class="form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox"> {{ __('Desejo receber novidades por
                                e-mail')}}
                            </label>
                        </div>
                    </div>
                    <a href="{{route('index')}}" class="btn btn-outline-danger mr-2">{{ __('Voltar')}}</a>
                    <button type="submit" class="btn btn-outline-success mr-2">{{ __('Salvar')}}</button>
                </div>


            </form>
        </div>
    </div>
</div>
<!--Fim Form-->
@endsection
