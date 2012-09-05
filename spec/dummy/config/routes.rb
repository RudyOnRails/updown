Rails.application.routes.draw do
  
  root :to => 'questions#index'
  resources :questions

  mount Updown::Engine => "/updown"
end
