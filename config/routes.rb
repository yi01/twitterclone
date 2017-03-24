Rails.application.routes.draw do
  resources :tweets, only: [:new, :create, :edit, :update ,:destroy] do
    collection do
      post :confirm
    end
  end
  root 'tweets#index'
end
