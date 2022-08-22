Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index'
  get '/gods', to: 'gods#index'
  get '/gods/new', to: 'gods#new'
  get '/monsters', to: 'monsters#index'
  get '/monsters/new', to: 'monsters#new'
  post '/gods', to: 'gods#create'
  post '/monsters', to: 'monsters#create'
  get '/gods/:id', to: 'gods#show'
  get '/gods/:id/edit', to: 'gods#edit'
  patch '/gods/:id', to: 'gods#update'
  delete '/gods/:id', to: 'gods#destroy'
end

