<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Support\Facades\Auth;
use Validator;
class AuthController extends BaseController
{

    public  function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);
        if($validator->fails()){
            return $this->handleError($validator->errors());
        }
        if (!Auth::attempt($request->only('email', 'password'))) {
        return  $this->handleError([
            'message' => 'Invalid login details'], 401,401);
        return response()->json([
        'message' => 'Invalid login details'], 401);}

        $user = User::where('email', $request['email'])->firstOrFail();

        $token = $user->createToken('auth_token')->plainTextToken;


        return $this->handleResponse(([
            'email' => $request['email'],
           'access_token' => $token,
           'token_type' => 'Bearer',
        ]), 'User loged-in');

        return response()->json([
           'email' => $request['email'],
           'access_token' => $token,
           'token_type' => 'Bearer',
        ]);
    }


    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required',
            'confirm_password' => 'required|same:password',
        ]);
        if($validator->fails()){
            return $this->handleError($validator->errors());
        }
        if (User::where('email', $request->email)->exists()) {
            return AuthController::login($request);
        }

        if($request->password = null || strlen($request->password) < 8){
            return response()->json([
                'message' => 'Password should have minimum 8 characters'], 411);
        }

        if(!AuthController::validateEmail($request->email)){
            return response()->json([
                'message' => 'Invalid email'], 406);
        }

        if($request->name == null || strlen($request->name) < 3){
            echo $request->name;
            return response()->json([
                'message' => 'Invalid username'], 406);
        }

        try{
            $validatedData = $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:users',
                'password' => 'required|string|min:8',
            ]);
        } catch(\Illuminate\Validation\ValidationException $e) {
        
            return response()->json([
                'message' => $e->getMessage()
            ]);
        }

        // echo json_encode($validatedData);

        $user = User::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => Hash::make($validatedData['password']),
        ]);

        $token = $user->createToken('auth_token')->plainTextToken;

        return $this->handleResponse(([
            'access_token' => $token,
            'token_type' => 'Bearer',
        ]), 
        'User successfully registered');

    }

    public function me(Request $request)
    {
        return $request->user();
    }

    static function validateEmail($str) {
        return (!preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $str)) ? FALSE : TRUE;
    }
}
