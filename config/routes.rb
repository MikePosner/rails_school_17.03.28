Rails.application.routes.draw do
  get 'admins/show_teachers', to: 'admins#show_teachers'
  get 'admins/show_students', to: 'admins#show_students'
  get 'admins/show_classes', to: 'admins#show_classes'
  resources:admins
  resources:sessions
  resources:generals_teacher
  resources:generals_student
  resources:general_teachers
  resources:general_students
  resources:rooms

# get '/admins/show_teachers' => 'admins#show_teachers'

  patch 'generals_teacher/:id' => 'generals_teacher#update'

  get 'admins/show'

  # get 'admins/show_teachers', to: 'admins#show_teachers'

  post 'general_teachers/show'

  post 'general_students/show'

  get 'sessions/show', to: 'sessions#show'

  get 'sessions/new'

  post 'sessions/login'

  get 'applicants/new'

  post 'applicants/create'

  root "sessions#new"
end
