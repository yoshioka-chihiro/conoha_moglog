Rails.application.routes.draw do
  namespace :admin do
    get 'end_users/index'
    get 'end_users/show'
    get 'end_users/edit'
  end
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :end_user, skip: [:passwords], path: :me, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: 'public/homes#top'

  scope module: :public do

    get 'about' => 'public/homes#about'
    get 'personal_index/:id' => 'diaries#personal_index'
    delete 'end_users/image_destroy'
    resources :diaries, only:[:index, :show, :edit, :create, :update] do
      resource :favorites, only: [:create, :destroy]
      resources :diary_comments, only: [:create, :destroy] do
        resource :reports, only: [:create, :destroy]
      end
    end

    resources :end_users, only:[:show, :edit, :update, :index] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    get 'meal_details/show'
    resources :foods, only:[:index, :show]
    resources :meals, only:[:index, :show, :edit, :update, :create, :destroy] do
      collection do
        get 'search'
      end
    end
    resources :meal_details, only:[:index, :create, :update, :destroy]
    resources :weights, only:[:index, :edit, :create, :edit, :update, :destroy]
    resources :conditions, only:[:index, :create, :update, :destroy, :edit, :show]

    patch 'end_users/:id/withdraw' => 'end_users#withdraw'
    get 'end_users/unsubscribe' => 'end_users#unsubscribe'
    get "search" => "searches#search"


  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :diary_comments, only:[:index, :show, :edit, :destroy]
    resources :foods, only:[:index, :show, :new, :edit, :create, :update, :destroy]
    resources :end_users, only:[:index, :show, :edit, :update]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
