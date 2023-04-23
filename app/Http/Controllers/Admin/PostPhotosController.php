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

    public function addPhotos(Request $request, int $id) {
        $post = $this->model->find($id);
        if($request->hasFile('photos')){
            $images = $this->imagesUpload($request->file('photos'), $this->view, 'photo');
            $post->photos()->createMany($images);
            flash('Foto(s) adicionadas com Sucesso!')->success();
            return redirect()->route('admin.posts.edit', ['post' => $id])->withSuccess('Foto(s) adicionadas com sucesso!');
        }
    }

    public function removePhoto(Request $request){

        $photoName = $request->get('photoName');

        //removo dos arquivos
        if(Storage::disk('public')->exists($photoName)) {
            Storage::disk('public')->delete($photoName);
        }
        //removo a imagem do banco
        $removePhoto = PostPhotos::where('photo', $photoName);
        $Postid = $removePhoto->first()->post_id;
        $removePhoto->delete();

        return redirect()->route('admin.posts.edit', ['post' => $Postid])->withSuccess('Removido com sucesso!');

    }
}
