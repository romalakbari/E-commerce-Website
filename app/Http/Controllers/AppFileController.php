<?php

namespace App\Http\Controllers;

use App\Models\AppFile;
use Illuminate\Http\Request;
use App\Models\Product;

class AppFileController extends Controller
{

    public function index()
    {
        $filesInFolder = \File::files(public_path('files'));
        $paths = array();
        foreach($filesInFolder as $path) {
              $file = pathinfo($path);
              array_push($paths,$file['filename']. '.' .$file['extension']);
         }

        return response()->json(["result" => true, "data" => $paths]);
    }


    public function store(Request $request)
    {
        $files = $request->file('files');
    
        $files = $request->file('files');
         if (!is_array($files)) {
            // Handle the case where $files is not an array (possibly null)

            return response()->json(['message' => 'No files provided'], 400);
        }

        $uploadedFiles = [];
        foreach ($files as $file) {

            $filename = $file->getClientOriginalName(); 
            $file->move(public_path('files'), $filename);
            $uploadedFiles[] = [
                "name" => $filename,
                "url" => 'files/' . $filename,
                "product_id" => 21,
                "type" => 'download'
            ];
        }
        AppFile::insert($uploadedFiles);
        return response()->json(['message' => 'Files uploaded successfully']);

    }


    public function update(Request $request, AppFile $appFile)
    {
        //
    }


    public function destroy(AppFile $appFile)
    {
        //
    }
}
