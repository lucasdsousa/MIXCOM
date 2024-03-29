<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    public function endereco(){
        return $this->hasOne('App\Endereco');
    }
    public function userfis(){
        return $this->hasOne('App\Userfis');
    }
    public function userjurs(){
        return $this->hasOne('App\Userjur');
    }

    protected $fillable = [
        'name', 'telefone', 'email', 'password',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];
}
