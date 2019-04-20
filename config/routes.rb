Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # the index of the post will be the root, this is in the controller
  root 'posts#index'

  # route to the about page
  get 'about' => 'pages#about'

  # change post to resource
  # this gives you access to a lot of premade HTTP methods
  resources :posts
end
