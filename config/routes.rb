Rails.application.routes.draw do
  devise_for :users

  resources :exams
  root 'exams#index'
end
