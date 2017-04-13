Rails.application.routes.draw do
  devise_for :users

  resources :exams

  namespace :admin do
    resources :exams do
      member  do
        post :publish
        post :hide
      end
    end
  end

  root 'exams#index'
end
