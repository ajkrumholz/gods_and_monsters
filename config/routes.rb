Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index'
  get '/gods', to: 'gods#index'
  get '/gods/new', to: 'gods#new'
  get '/monsters', to: 'monsters#index'
  get '/monsters/new', to: 'monsters#new'
end
