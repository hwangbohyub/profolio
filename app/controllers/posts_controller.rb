class PostsController < ApplicationController
  before_action :log_impression, :only=> [:show]

  def log_impression
      @hit_post = Post.find(params[:post_id])
      # this assumes you have a current_user method in your authentication system
      @hit_post.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
  end
  #posts
  def post
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

  def write
    if current_user.nil?
      redirect_to '/users/sign_in'
    end
  end

  def create
    uploader = FileUploader.new
    uploader.store!(params[:file])

    Post.create(user_id: current_user.id ,file_url: uploader.url,title: params[:title], content: params[:content], original_filename: params[:file].original_filename)

    redirect_to '/posts'
  end

  def view
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.content = params[:content]
    @post.save

    redirect_to "/posts/#{@post.id}"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    redirect_to '/posts'
  end
end
