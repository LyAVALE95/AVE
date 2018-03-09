Rails.application.routes.draw do
  resources :question_options
  resources :questions
  resources :quizzes
  resources :session_details
  resources :consultations
  resources :sessions
  resources :algorithms
  resources :amethods
  resources :groups
  #devise_for :users
  devise_for :users, controllers: { registrations: "users/registrations",sessions: "users/sessions"}
  #devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :user_teachers
  resources :user_students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "user_students#index"
end
