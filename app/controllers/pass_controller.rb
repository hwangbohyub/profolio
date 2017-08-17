class PassController < ApplicationController
  before_action :log_impression, :only=> [:show]

  def log_impression
      @hit_post = Post.find(params[:post_id])
      # this assumes you have a current_user method in your authentication system
      @hit_post.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
  end
  #pass
  def pass
    @passes = Pass.all.order("created_at DESC")

    if params[:query]
      @passes = Pass.search(params[:query]).order("created_at DESC")
      @search_result = 1
    else
      @passes = Pass.all.order("created_at DESC")
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

    Pass.create(user_id: current_user.id, file_url: uploader.url,title: params[:title], content: params[:content], original_filename: params[:file].original_filename)

    redirect_to '/pass'
  end

  def view
    @pass = Pass.find(params[:id])
  end

  def edit
    @pass = Pass.find(params[:id])
  end

  def update
    @pass = Pass.find(params[:id])
    @pass.content = params[:content]
    @pass.save

    redirect_to "/pass/#{@pass.id}"
  end

  def destroy
    pass = Pass.find(params[:id])
    pass.destroy

    redirect_to '/pass'
  end
end
