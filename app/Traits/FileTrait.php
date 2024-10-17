<?php

namespace App\Traits;

use Zip;
use ZipArchive;
use File;
// use App\Models\File;
use App\Models\PersonalFile;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use Intervention\Image\Image;
use Illuminate\Http\UploadedFile;
use STS\ZipStream\ZipStreamFacade;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Carbon;

trait FileTrait
{


    public $disk = "public";
    public $prefix = "category";
    public $amazonBaseUrl = "";
    public $imageTypes = ['image/png', 'image/jpg', 'image/jpeg', 'image/gif', 'image/webp'];
    public $iconTpye = ['image/svg+xml', 'image/vnd.microsoft.icon'];

    /**
     * Store file in $disk directory
     *
     * @param UploadedFile $file
     * @return string
     */
    public function storeProductFile($photo,$type){
        $location = '/files';
        $photo_path = '';
        if($type == 'preview'){
            $photo_path = Storage::disk('public')->put($location, $photo);
            $photo_path = 'storage/'. $photo_path;
        }
        else
            $photo_path = Storage::disk('local')->put($location, $photo);

        return $photo_path;
    }

    public function storeFile(UploadedFile $file): string
    {
        return Storage::disk($this->disk)->putFile($this->prefix, $file);
    }

    // public function storeBase64File($file){
    //     $folderPath = "/images/"; //path location
    //     $image_parts = explode(";base64,", $file);
    //     $image_type_aux = explode("/", $image_parts[0]);
    //     $image_type = $image_type_aux[1];
    //     $image_base64 = base64_decode($image_parts[1]);
    //     $uniqid = uniqid();
    //     $file = $folderPath . $uniqid . '.'.$image_type;
    //     return Storage::disk('public')->put($folderPath . time() .".".$image_type, $image_base64);
    // }


    /**
     * Store file with a name
     *
     * @param UploadedFile $file
     * @param string $filename
     * @return string
     */
    public function storeFileAs(UploadedFile $file, string $filename): string
    {
        return Storage::disk($this->disk)->putFileAs($this->prefix, $file, $filename);
    }

    public function storeImageAsFile(Image $file, string $filename): string
    {

        $filename = $this->prefix . '/' . $filename;
        $res =  Storage::disk($this->disk)->put($filename, $file->encode());
        if ($res) {
            return $filename;
        }
        return false;
    }


    /**
     * Store file with base64 file type
     * @param string $file
     * @param string $recordId
     * @return string
     */
    public function storeBase64File($file, $recordId)
    {
        $extension = explode('/', explode(':', substr($file, 0, strpos($file, ';')))[1])[1];
        return Storage::disk($this->disk)->putFileAs($this->prefix, $file, $recordId . '.' . $extension);
    }

    /**
     * Store multiple files in $disk
     *
     * @param array $files
     * @return array
     */
    public function storeFiles(array $files): array
    {
        $filesPath = [];
        foreach ($files as $file) {
            $path = $this->storeFile($file);
            array_push($filesPath, $path);
        }

        return $filesPath;
    }

    /**
     * Store and remove a file
     *
     * @param UploadedFile $file
     * @param string fileUrl
     * @return string
     */
    public function storeAndRemove(UploadedFile $file, string $filename): string
    {
        $this->deleteFile($filename);
        return $this->storeFile($file);
    }


    /**
     * Delete file from $disk and return 1 for success deletion
     *
     * @param string file
     * @return bool
     */
    public function deleteFile(string $file): bool
    {
        if (File::exists($file)){
            File::delete($file);
        }
        return true;
    }


    /**
     * Delete multiple files and return 1 for success deletion
     *
     * @param array $files
     * @return bool
     */
    public function deleteFiles(array $files): bool
    {
        $filteredPaths = [];
        foreach ($files as $file) {
            $filteredPath = str_replace($this->amazonBaseUrl, "", $file);
            array_push($filteredPaths, $filteredPath);
        }
        return Storage::disk($this->disk)->delete($filteredPaths);
    }



    public function makeFolderAsZipStream($files, $folderName)
    {
        $filePaths = [];
        foreach ($files as $file) {
            $fileName = Str::after($file->path, $folderName);
            $filePath = Storage::disk($this->disk)->path($file->path);
            $filePaths[$filePath] = $fileName;
        }
        if ($filePaths)
            return ZipStreamFacade::create("$folderName.zip", $filePaths);
        return null;
    }

    public function getFullPath($file_path)
    {
        return Storage::disk($this->disk)->path($file_path);
    }

    public function existsFile($file_path)
    {
        return Storage::disk($this->disk)->exists($file_path);
    }

    // public function downloadFile($file_path)
    // {
    //     Storage::disk($this->disk)->download($file_path);
    // }

    public function readFileAsStream($file_path)
    {
        return Storage::disk($this->disk)->readStream($file_path);
    }


    public function downloadFile($path){
        if(Storage::disk('local')->exists($path)){
            $myPath = Storage::disk('local')->path($path);
            // $headers = array('Content-Type'=>'application/octet-stream',);
            // $headers = array('Content-Type'=>'Content-Disposition',);
            // $zip_new_name = "Invoice-".date("y-m-d-h-i-s").".zip";
            return response()->download($myPath);
        }
        return "No Media Found";
    }
}
