Rails.application.routes.draw do
  resources :club_students
  resources :exam_results
  resources :clubs
  resources :subjects
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students
  root to: 'students#index'
end
