Rails.application.routes.draw do

  devise_for :users
  root 'home#main'

  #pass
  get 'home/pass'
  get 'home/write_pass' => 'home#write_pass'
  post 'home/create_pass' => 'home#create_pass'
  get 'home/view_pass/:id' => 'home#view_pass'
  get 'home/search_pass' => 'home#search_pass'

  #posts
  get 'posts/all'
  get 'posts/write_all' => 'posts#write_all'
  post 'posts/create_all' => 'posts#create_all'
  get 'posts/view_all/:id' => 'posts#view_all'
  get 'posts/search_all' => 'posts#search_all'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
