<?php

namespace App\Http\Controllers;

use App\Http\Controllers\API\BaseController;
use App\Models\category;
use App\Models\User;
use Faker\Provider\Base;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
class CategoryController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $category = Category::all();
        return $this->handleResponse(([
            $category
        ]), 'Categories get successfully' );
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $user = Auth::user();
        if ($user['is_admin'] == '0') {
            return $this->handleError([
                'message' => 'Unauthorized'], '401',401);
        }
        $validator = Validator::make($request->all(), [
            'name' => 'required|unique:categories',
        ]);
        if($validator->fails()){
            return $this->handleError($validator->errors(), null, 401);
        }

        $user = Category::create([
            'name' => $request['name']
        ]);

        return $this->handleResponse(([
            $user
        ]),
            'Category successfully created');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {


    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\category  $category
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        if (Category::where('id', $id)->exists()) {
            return $this->handleResponse(([
                Category::where('id', $id)->get()
            ]), 'Category get successfully' );
        }
        return $this->handleError([
            'message' => 'Invalid category id'], 401,401);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $user = Auth::user();
        if ($user['is_admin'] == '0') {
            return $this->handleError([
                'message' => 'Unauthorized'], '401',401);
        }
        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'name' => 'required',
        ]);
        if($validator->fails()){
            return $this->handleError($validator->errors(), null, 401);
        }
        if (Category::where('id', $request->id)->exists()) {
            $category = Category::find($request->id);
            $category->name = $request['name'];
            $category->save();
            return $this->handleResponse(([
                Category::where('id', $request->id)->get()
            ]), 'Category ' . $request->id . ' updated successfully' );
        }
        return $this->handleError('Category not found', null, 401);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, category $category)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $user = Auth::user();
        if ($user['is_admin'] == '0') {
            return $this->handleError([
                'message' => 'Unauthorized'], '401',401);
        }
        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);

        if (Category::where('id', $request->id)->exists()) {

            $category = Category::find($request->id);
            $exist_category = $category;
            $category->delete();
            return $this->handleResponse(([
                $exist_category
            ]), 'Category ' . $request->id . ' successfully deleted' );
        }
        return $this->handleError('Category not found', null, 401);
    }
}
