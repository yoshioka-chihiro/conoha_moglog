Rails.application.routes.draw do
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :end_users, skip: [:passwords], path: :me, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  
  namespace :public do
    get 'homes/top'
    get 'homes/about'
    
    get 'diaries/index'
    get 'diaries/new'
    get 'diaries/show'
    get 'diaries/edit'
    
    get 'meal_details/show'
    
    get 'foods/index'
    get 'foods/show'
    
    get 'meals/index'
    get 'meals/show'
    
    get 'weights/index'
    get 'weights/edit'
  end
  
  namespace :admin do
    get 'homes/top'
    
    get 'diary_comments/index'
    get 'diary_comments/show'
    get 'diary_comments/edit'
    
    get 'foods/index'
    get 'foods/show'
    get 'foods/new'
    get 'foods/edit'
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
