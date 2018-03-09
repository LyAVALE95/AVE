Rails.application.routes.draw do
  resources :groups
  #devise_for :users
  devise_for :users, controllers: { registrations: "users/registrations",sessions: "users/sessions"}
  #devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :user_teachers
  resources :user_students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "user_students#index"
end
