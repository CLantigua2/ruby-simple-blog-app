Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # the index of the post will be the root, this is in the controller
  root 'posts#index', as: 'home'

  # route to the about page
  get 'about' => 'pages#about', as: 'about'

  # change post to resource
  # this gives you access to a lot of premade HTTP methods
  resources :posts do
    resources :comments
  end
end
