<?php


namespace App\Traits;

use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

trait UploadTraits
{
    public function imageUpload($image, $dir, $fotoAtual = ""){
        if(is_null($fotoAtual) && Storage::disk('public')->exists($fotoAtual)){
            Storage::disk('public')->delete($fotoAtual);
            Storage::disk('public/thumbnail')->delete($fotoAtual);
        }
        if (!is_dir(public_path('/storage/thumbnail' . '/' . $dir))) {
            mkdir(public_path('/storage/thumbnail' . '/' . $dir), 0775, true);
        }
        $caminho = $image->store($dir, 'public');
        // Pega a imagem já salva e redimensiona proporcionalmente
        Image::make(public_path("/storage/") . $caminho)
            ->save(public_path("/storage/") . $caminho, 60)
            // Redimensionada a imagem
            ->resize(300, 300, function($constraint){
                $constraint->aspectRatio();
            })
            // Pega a imagem redimensionada e salva na pasta thumbnail
            ->save(public_path("/storage/thumbnail/") . $caminho);
        return $caminho;
    }
    public function imagesUpload($images, $dir, $imageColumn = null){
        if (!is_dir(public_path('/storage/thumbnail' . '/' . $dir))) {
            mkdir(public_path('/storage/thumbnail' . '/' . $dir), 0775, true);
        }
        foreach ($images as $image) {
            $uploadImages[] = [$imageColumn => $image->store($dir, 'public')];
            // Pega a imagem já salva e redimensiona proporcionalmente
            Image::make(public_path("/storage/") . $image)
                ->save(public_path("/storage/") . $image, 60)
                // Redimensionada a imagem
                ->resize(300, 300, function($constraint){
                    $constraint->aspectRatio();
                })
                // Pega a imagem redimensionada e salva na pasta thumbnail
                ->save(public_path("/storage/thumbnail/") . $image);
        }
        return $uploadImages;
    }
}
