<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Models\RakModel;

class RackController extends Controller
{
   public function index()
   {
    $dataRak = RakModel::all();
    return response()->json([
        'message' => "Semua Data Categori",
        'Data' => $dataRak
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
        }
        $dataRak = new RakModel;
        $dataRak->name = $request->name;
        $dataRak->save();
        return response()->json([
            'Data' => $dataRak,
            'message' => "Data Berhasil Disimpan"
        ], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $dataRak = RakModel::find($id);
        return response()->json([
            'Data' => $dataRak,
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
        $dataRak = RakModel::find($id);
        $dataRak->name = $request->name;
        $dataRak->save();
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
        $dataRak = RakModel::find($id);
        $dataRak->delete();
        return response()->json([
            'message' => "Berhasil Di Hapus"
        ], 200);
    }
}
