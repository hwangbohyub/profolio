class PostsController < ApplicationController
  #posts
  def all
    @posts = Post.all.order("created_at DESC")

    if params[:query]
      @posts = Post.search(params[:query]).order("created_at DESC")
      @search_result = 1
    else
      @posts = Post.all.order("created_at DESC")
    end

    #image
    @user = 'user.png'
  end

  def write_all

  end

  def create_all
    uploader = FileUploader.new
    uploader.store!(params[:all_file])

    Post.create(file_url: uploader.url, content: params[:content], original_filename: params[:all_file].original_filename)

    redirect_to "/posts/all"
  end

  def view_all
    @post = Post.find(params[:id])
  end
end
