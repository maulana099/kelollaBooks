<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Models\User;
use App\Http\Controllers\BaseApiController;
use Validator;
use Illuminate\Support\Str;
use App\Reminder;
use Illuminate\Support\Facades\Password;
use DB;
use Mail;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use \App\Notifications\ResetPassNotification;

class AkunController extends BaseApiController
{
	public function register (Request $request){
		$validate = Validator::make($request->all(), [
			'name' => 'required',
			'email' => 'required|email|unique:users',
			'password' => 'required|min:6',
			'confirmation' => 'required|same:password',
		]);

		if ($validate->fails()) {
			return $this->responseError('Register Gagal', 422, $validate->errors());
		}else{ 
			$data = User::create([
				'name' => $request->name,
				'email' => $request->email,
				'password' => bcrypt($request->password),
				'api_token' => Str::random(60)
			]);

			return response()->json([
				'message' => "Register Berhasil",
				'data' => $data,
				'api_token' => $data->api_token
			], 201);
		}
	}

	public function login(Request $request){
		$validate = Validator::make($request->all(), [
			'email' => 'required|email',
			'password' => 'required|min:6',
		]);

		$data = [
			'email' => $request->email,
			'password' => $request->password
		];

		// cekk validasi
		if ($validate->fails()) {
			return $this->responseError('Login Gagal', 422, $validate->errors());
		}

		if (Auth::attempt($data)) {
			$user = Auth::user();
			$user->api_token = Str::random(60);
			$user->save();
			return response()->json([
				'message' => 'login Berhasil',
				'api_token' => $user->api_token,
			], 200);

		}
		return response([
			'message' => "login Gagal",
			'errors' => "Cek kembali email atau password anda"
		], 401);

	}


	public function forgotPassword(Request $request){
		$user = User::where('email', $request->email)->first();
		if ($user != null){

			$token = Str::random(12);
			DB::table('password_resets')->insert([
				'token' => $token,
				'email' => $user->email
			]);

			$user->token_password = $token;
			$user->save();

			$user->notify(new ResetPassNotification($token));
			return response()->json([
				'message' => "Reset password berhasil, silahkan cek email anda",
				'Data' =>  $user
			], 201);
		}
	}

	public function resetPass(Request $request){
		$validate = Validator::make($request->all(),[
			'email' => 'required|email:users',
			'password' => 'required|min:6|confirmed',
			'confirmation' => 'required|same:password',
			'token' => 'required'

		]);

		$email = $request->email;
		$tokenLama = $request->token;

		$user = User::where('email', $email)->where('token_password', $tokenLama)->first();
		if ($user != null){

			$tokenBaru = Str::random(60);
			$password = bcrypt($request->password);

			$user->password = $password;
			$user->api_token = $tokenBaru;
			$user->save();

			return response()->json([
				'message' => "Password Berhasil Dirubah",
				'api_token' => $user->api_token
			], 201);
		}else{
			return response()->json([
				'message' => "Gagal Merubah Password"
			], 422);
		}

	}	


}
