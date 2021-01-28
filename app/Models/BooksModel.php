<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BooksModel extends Model
{
    // use HasFactory;
    protected $table = 'book';
    protected $fillable = ['isbn','title','author','total_page','rack_id','categories'];

    public function rack(){
    	return $this->belongsTo(RakModel::class);
    }
}
