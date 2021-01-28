<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class BaseApiController extends Controller
{
    public function responseOk($result, $code = 200, $message = 'Sukses'){

    	$response = [
    		'message' => $message,
    		'code' => $code,
    		'data' => $result,
    	];

    	return response()->json($response, $code);
    }

    public function responseError($error, $code = 422, $errorDetails = []){
    	$response = [
    		'error' => $error,
    		'code' => $code,
    	];

    	if (!empty($errorDetails)) {
    		$response['errorDetails'] = $errorDetails;
    	}

    	return response()->json($response, $code);
    }
}
