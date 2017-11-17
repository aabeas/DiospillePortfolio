Rails.application.routes.draw do

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs
  resources :portfolios

  root to: 'pages#home'

end
