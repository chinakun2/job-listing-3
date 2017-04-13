Rails.application.routes.draw do
  devise_for :users

  resources :exams

  namespace :admin do
    resources :exams
  end
  
  root 'exams#index'
end
