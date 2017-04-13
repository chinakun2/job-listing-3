Rails.application.routes.draw do
  devise_for :users

  resources :exams do
    resources :resumes
  end

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
