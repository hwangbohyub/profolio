class HomeController < ApplicationController

  #home
  def main
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

  def write_pass
  end

  def create_pass
    uploader = FileUploader.new
    uploader.store!(params[:pass_file])

    Pass.create(file_url: uploader.url, content: params[:content], original_filename: params[:pass_file].original_filename)

    redirect_to "/home/pass"
  end

  def view_pass
    @pass = Pass.find(params[:id])
  end

end
