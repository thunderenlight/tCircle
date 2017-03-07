Rails.application.routes.draw do
  get 'interests/new'

  get 'interests/edit'

  get 'interests/show'

  get 'interests/index'

  get 'interests/destroy'

  get 'interests/update'

  get 'interests/create'

  # get 'users/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'

end


