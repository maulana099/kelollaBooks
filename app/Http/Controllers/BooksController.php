<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\BooksModel;
use App\Models\CategoriModel;
use Validator;

class BooksController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $search = $request->keyword;

        $dataBuku = BooksModel::with('rack')
            ->where('title', 'like', '%'.$search.'%')
            ->paginate(10);

        if($dataBuku != null){
            foreach($dataBuku as $item){
                $param = $item->categories;
                $dataArr = json_decode($param);
                $dataCategori = CategoriModel::whereIn('id', [$dataArr, True])->get('name');
                $item->categories = $dataCategori;
            }
            return response()->json([
                'message' => "List Data Buku",
                'Data' => $dataBuku
            ], 201);        
        }
        return response()->json([
            'message' => 'Data Buku Tidak Ada',
        ], 422);
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
        $validate = Validator::make($request->all(),[
            'isbn' => 'required|unique:book',
            'title' => 'required',
            'author' => 'required',
            'total_page' => 'required',
        ]);
        $dataBook = new BooksModel;
        $dataBook->isbn = $request->isbn;
        $dataBook->title = $request->title;
        $dataBook->author = $request->author;
        $dataBook->total_page = $request->total_page;
        $dataBook->rack_id = $request->rack_id;
        $dataBook->categories = $request->categories;
        if ($validate->fails()) {
            return response()->json([
                'errors' => $validate->errors(),
                'message' => "pastikan kembali input sesuai"
            ], 422);
        }
        $dataBook->save();
        return response()->json([
            'Data' => $dataBook,
            'message' => "Sukses Data Berhasil di input"
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
        //
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
        $dataBook = BooksModel::find($id);
        $dataBook->isbn = $request->isbn;
        $dataBook->title = $request->title;
        $dataBook->author = $request->author;
        $dataBook->total_page = $request->total_page;
        $dataBook->rack_id = $request->rack_id;
        $dataBook->categories = $request->categories;
        $dataBook->save();
        if ($dataBook) {
            return response()->json([
                'Data' => $dataBook,
                'message' => "Sukses Data Berhasil di update"
            ], 200);
        }
        return response()->json([
            'message' => "Data Buku Tidak Ada",
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $dataBook = BooksModel::find($id);
        $dataBook->delete();
        return response()->json([
            'message' => "Data Berhasil di Hapus"
        ], 200);
    }

}
