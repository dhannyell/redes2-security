Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :index
   resources :injection
   match '/injection', to: 'injection#search', via: 'post'
   root 'index#index'

end
