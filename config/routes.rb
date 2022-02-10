Rails.application.routes.draw do
  resources :question_categories
  resources :solutions
  resources :users

  resources :answers
  resources :questions
  resources :categories
  resources :admins


end
