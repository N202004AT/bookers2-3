Rails.application.routes.draw do
  devise_for :users
  get '/' => 'homes#top'
  get '/home/about' => 'homes#show'
  get '/users/sign_out' => 'sessions#destroy'
  resources :users, only:[:index,:show,:edit,:update]
  resources :books,only:[:new,:create,:index,:show,:edit,:update,:delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
