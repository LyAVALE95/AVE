Rails.application.routes.draw do
  resources :schools
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
  devise_scope :user do  
    match '/sessions/user', to: 'users/sessions#create', via: :post
  end
  #devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :user_teachers
  resources :user_students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
    #root :to => "invoices#index"
      root to: "home#index"
  end
  #root :to => redirect("/users/sign_in")
  get '/home/welcome', :to =>'home#welcome'
  root :to => redirect("/home/welcome")
    #post ':controller(/:action(/:id(.:format)))'
    #get ':controller(/:action(/:id(.:format)))'
  

end
