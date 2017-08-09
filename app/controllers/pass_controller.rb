class PassController < ApplicationController
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
  end

  def create
    uploader = FileUploader.new
    uploader.store!(params[:file])

    Pass.create(user_id: current_user.id, file_url: uploader.url, content: params[:content], original_filename: params[:file].original_filename)

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
