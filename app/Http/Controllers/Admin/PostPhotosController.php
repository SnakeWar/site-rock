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

        return response()->json(['photos' => $photoList]);
    }

    public function addPhotos(Request $request, int $id) {
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
            flash('Foto(s) adicionadas com Sucesso!')->success();
            return redirect()->route('admin.posts.edit', ['post' => $id])->withSuccess('Foto(s) adicionadas com sucesso!');
        }
    }

    public function updateOrder(Request $request)
    {
        $imageIds = $request->input('imageIds');

        // Atualizar a ordem das imagens no banco de dados
        foreach ($imageIds as $index => $imageId) {
            PostPhotos::where('id', $imageId)
                ->update(['photos_order' => $index + 1]);
        }

        return response()->json(['message' => 'Ordem atualizada com sucesso.']);
    }
}
