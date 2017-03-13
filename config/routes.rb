Rails.application.routes.draw do

  # get 'boards/index'

  # get 'boards/show'

  # get 'boards/new'

  # get 'boards/edit'

  # get 'boards/create'

  # get 'boards/update'

  # get 'boards/destroy'

  resources :boards
  resources :interests


  # get 'interests/edit'

  # get 'interests/show'

  # get 'interests/index'

  # get 'interests/destroy'

  # get 'interests/update'

  # get 'interests/create'

  get 'users/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'

end


