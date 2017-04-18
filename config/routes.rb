Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :exams do
    resources :resumes
  end

  namespace :admin do

    resources :exams do
      member  do
        post :publish
        post :hide
      end
      resources :resumes

    end
    resources :users
  end

  resources :welcome do

  end

  namespace :account do
    resources :exams
  end

  root 'welcome#index'
end
