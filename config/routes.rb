Rails.application.routes.draw do

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :end_users, skip: [:passwords], path: :me, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: 'public/homes#top'

  scope module: :public do
    get 'homes/about'

    resources :diaries, only:[:new, :index, :show, :edit] do
      resources :favorites, only: [:create, :destroy]
    end

    resources :end_user, only:[:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
    end

    get 'meal_details/show'

    resources :foods, only:[:index, :show]
    resources :meals, only:[:index, :show, :edit, :update]
    resources :weights, only:[:index, :edit]

  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :diary_comments, only:[:index, :show, :edit]
    resources :foods, only:[:index, :show, :new, :edit]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
