Rails.application.routes.draw do
  resources :user_sgs
  resources :user_quizzes
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
  resources :reports
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
  get '/home/home', :to =>'home#home'
  get '/home/index', :to =>'home#index'
  root :to => redirect("/home/home")
  post 'sessions' => 'session_details#create'
  post 'quizzes' => 'questions#create'
  get 'quizzes' => 'questions#index'
  post 'questions' => 'question_options#create'
  get '/home/alg', :to =>'home#alg'
  get '/myuser', :to =>'home#myuser'
  get '/getmygroups/:id' =>'home#getmygroups'
  get '/getmyteachers/:id' =>'home#getmyteachers'
  put '/myuserupdatedata/:id' => 'user_students#updatemyusr'
  get '/bygroup/:id', :to =>'reports#bygroup'
  get '/gbygroupall', :to =>'reports#gbygroupall'
  
  #Ferb:
  get '/preguntas/:id', :to => 'questions#preguntas' #Trae las preguntas del quizz' especificando el id del quizz' (quizz_id)
  get '/respuestas/:id', :to => 'question_options#respuestas' #Trae las respuestas de la pregunta especificada con el id de la question' (question_id)
  get '/buscarPromedio/:id', :to => 'groups#buscarPromedio' #Trae el promedio del grupo que el profesor tenga registrado (group_id)
  post '/UserQuiz', :to => 'user_quizzes#UserQuiz'  #Agrega o modifica la tabla de user_quiz cada que revisan un examen en la app.
  get '/sessionsUser/:id', :to => 'sessions#sessionsUser'
    #post ':controller(/:action(/:id(.:format)))'
    #get ':controller(/:action(/:id(.:format)))'
  post 'amethods/count'

end
