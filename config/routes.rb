Rails.application.routes.draw do
  resources:admins
  resources:sessions
  resources:generals_teacher
  resources:generals_student
  resources:general_teachers
  resources:general_students

  patch 'generals_teacher/:id' => 'generals_teacher#update'
  
  get 'admins/show'

  post 'general_teachers/show'

  post 'general_students/show'

  get 'sessions/show', to: 'sessions#show'

  get 'sessions/new'

  post 'sessions/login'

  get 'applicants/new'

  post 'applicants/create'

  root "sessions#new"
end
