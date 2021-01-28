<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RakModel extends Model
{
    // use HasFactory;
    protected $table = 'rack';
    protected $fillable = ['name'];

    public function book(){
    	return $this->belongsTo(App\BooksModel::class, 'rack_id');
    }
}
