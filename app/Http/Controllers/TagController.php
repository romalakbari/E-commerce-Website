<?php

namespace App\Http\Controllers;

use App\Models\Tag;
use App\Models\ProductTag;
use App\Models\CategoryTag;
use Illuminate\Http\Request;


class TagController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if($request->paginate){
            return Tag::orderBy('name','asc')->paginate($request->paginate);
        }

        $tags = Tag::orderBy('name','asc')->get();
        $tags = $tags->unique(['name']);
        $myarr = array();
        foreach($tags as $t){
            array_push($myarr,$t);
        }
        return response()->json(["result"=>true, "data" => $myarr]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Tag  $tag
     * @return \Illuminate\Http\Response
     */
    public function show(Tag $tag)
    {
        $tag =  Tag::where('id',$tag->id)->with(['products.category','categoryTag'])->first();
        $myArray = array();

        foreach($tag->products as $product){
            $featured = false;
            if(CategoryTag::where('tag_id',$tag->id)->where('category_id', $product->category['id'])->first())
                $featured = true;

            $obj = (object) ["key" => $product->category['id'],"name" => $product->category['name'], "quantity" => 1, "featured"=>$featured];
            array_push($myArray, $obj);

        }

        return $myArray;


    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Tag  $tag
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Tag $tag)
    {
        $tag->update([
            "name" => $request->name
        ]);
        return $tag;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Tag  $tag
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Tag $tag)
    {
        $result = ProductTag::where('tag_id',$tag->id)->update(['tag_id'=>$request->moveTo]);
        if($result) return $tag->delete();

    }

    public function addOrRemoveFeatured(Request $request, $id){

       if($request->featured){
            $categorytag = CategoryTag::create([
                'category_id' => $request->category,
                'tag_id' => $id
            ]);
            return $categorytag;
       }
       else{
            $categorytag = CategoryTag::where('tag_id',$id)->where('category_id', $request->category)->first();
            return $categorytag->delete();
       }

    }
}
