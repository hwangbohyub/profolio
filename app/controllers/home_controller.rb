class HomeController < ApplicationController

  #home
  def main
    @first = 'first.jpg'
    @second = 'second.jpg'
    @third = 'third.jpg'
  end

  def my_posts
    user = User.find_by(id: current_user.id)
    @posts = user.posts # <- has_many :posts를 명시해서 사용 가능!
    @passes = user.passes

    #image
    @user = 'user.png'
  end

  def my_info
  end

  def intro
  end

  def mentor
  end

end
