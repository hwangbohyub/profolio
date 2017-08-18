Rails.application.routes.draw do

  devise_for :users

  #home
  root 'home#main'
  get '/my_posts' => 'home#my_posts'
  get '/my_info' => 'home#my_info'
  get '/intro' => 'home#intro'

  #guides
  get '/guides' => 'guides#home'
  get '/guide1' => 'guides#guide1'
  get '/guide2' => 'guides#guide2'
  get '/guide3' => 'guides#guide3'
  get '/guide4' => 'guides#guide4'

  #mentor
  get '/mentor' => 'mentor#home'

  #pass
  get '/pass' => 'pass#pass'
  get '/pass/write' => 'pass#write'
  post '/pass' => 'pass#create'
  get '/pass/:id' => 'pass#view'

  get '/pass/:id/edit' => 'pass#edit'
  put '/pass/:id' => 'pass#update'
  patch '/pass/:id' => 'pass#update'
  delete '/pass/:id' => 'pass#destroy'

  #posts
  get '/posts' => 'posts#post'
  get '/posts/write' => 'posts#write'
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#view'

  get '/posts/:id/edit' => 'posts#edit'
  put '/posts/:id' => 'posts#update'
  patch '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'

  #comments
  post '/comments/:post_id' => 'comments#create'
  delete '/comments/:post_id/:id' => 'comments#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
