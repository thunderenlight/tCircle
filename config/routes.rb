Rails.application.routes.draw do

  get 'comments/create'

  get 'home/index'

  # get 'boards/index'

  # get 'boards/show'

  # get 'boards/new'

  # get 'boards/edit'

  # get 'boards/create'

  # get 'boards/update'

  # get 'boards/destroy'

  resources :boards
  resources :interests do 
    resources :comments
  end
  get '/:username' => 'users#show', as: 'user'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

end


