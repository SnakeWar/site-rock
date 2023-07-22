<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\PostPhotos;
use App\Traits\Functions;
use App\Traits\UploadTraits;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class PostPhotosController extends Controller
{
    use UploadTraits, Functions;

    private $model;

    public function __construct(Post $model)
    {
        $this->middleware('auth');
        $this->view = 'posts/photos';
        $this->model = $model;
    }

    public function removePhoto(Request $request)
    {
        $photoName = $request->input('photoName');

        // Remover o arquivo
        if (Storage::disk('public')->exists($photoName)) {
            Storage::disk('public')->delete($photoName);
        }

        // Remover a foto do banco de dados
        $removePhoto = PostPhotos::where('photo', $photoName);
        $postId = $removePhoto->first()->post_id;
        $removePhoto->delete();

        $photoList = PostPhotos::where('post_id', $postId)->orderBy('photos_order', 'asc')->get();
        $postReordened = $this->updateOrder($photoList, $postId);
        return response()->json(['message' => 'Foto removida com sucesso.', 'photos' => $postReordened]);
    }

    public function addPhotos(Request $request, int $id)
    {
        $post = $this->model->find($id);
        if($request->hasFile('photos')){
            $images = $this->imagesUpload($request->file('photos'), $this->view, 'photo');
            $max = PostPhotos::where('post_id', $id)->max('photos_order');
            $order = $max+1 ?? 1;
            foreach  ($images as &$image) {
                $image['photos_order'] = $order;
                $order++;
            }
            unset($image);
            $post->photos()->createMany($images);
            $photoList = PostPhotos::where('post_id', $id)->orderBy('photos_order', 'asc')->get();
            $postReordened = $this->updateOrder($photoList, $id);
            return response()->json(['message' => 'Foto(s) adicionada(s) com sucesso.', 'photos' => $postReordened]);
        } else {
            return response()->json(['message' => 'Nenhuma foto foi enviada.', 'photos' => $post->photos()->orderBy('photos_order')->get()]);
        }
    }

    public function updateOrder($photos, $postId)
    {
        $index = 1;
        // Atualizar a ordem das imagens no banco de dados
        foreach ($photos as  $photo) {
            PostPhotos::where('id', $photo->id)
                ->update(['photos_order' => $index++]);
        }
        return $this->model->find($postId)->photos()->orderBy('photos_order')->get();
    }
}
