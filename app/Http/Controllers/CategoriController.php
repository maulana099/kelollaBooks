<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Models\CategoriModel;

class CategoriController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dataCategori = CategoriModel::all();
        return response()->json([
            'message' => "Semua Data Categori",
            'Data' => $dataCategori
        ], 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'name' => 'required',
        ]);

        if ($validate->fails()) {
            return response()->json([
                'errors' => $validate->errors(),
                'message' => "Categori Gagal Di Input"
            ], 422);
        }else{
            $dataCategori = new CategoriModel;
            $dataCategori->name = $request->name;
            $dataCategori->save();
            return response()->json([
                'Data' => $dataCategori,
                'message' => "Data Berhasil Disimpan"
            ], 200);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $dataCategori = CategoriModel::find($id);
        return response()->json([
            'Data' => $CategoriModel,
        ], 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $dataCategori = CategoriModel::find($id);
        $dataCategori->name = $request->name;
        $dataCategori->save();
        return response()->json([
            'message' => "Data Berhasil dirubah"
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $dataCategori = CategoriModel::find($id);
        $dataCategori->delete();
        return response()->json([
            'message' => "Berhasil Di Hapus"
        ], 200);
    }
}
