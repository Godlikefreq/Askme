Rails.application.routes.draw do
  root to: 'questions#index'
  resources :questions do
    member do
      put 'hide'
    end
  end

  get "questions/hashtag/:name", to:"questions#hashtags"

  resource :session, only: %i[new create destroy]
  resources :users, param: :nickname, except: %i[index]
end
