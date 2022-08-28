Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index'
  get '/gods', to: 'gods#index'
  get '/monsters', to: 'monsters#index'
  get '/gods/:id/menagerie', to: 'gods#menagerie'
  
  get '/gods/new', to: 'gods#new'
  get '/gods/:id/menagerie/new', to: 'monsters#new'

  post '/gods', to: 'gods#create'
  post '/monsters', to: 'monsters#create'

  get '/gods/:id', to: 'gods#show'
  get '/monsters/:id', to: 'monsters#show'

  get '/gods/:id/edit', to: 'gods#edit'
  get '/monsters/:id/edit', to: 'monsters#edit'
  
  patch '/gods/:id', to: 'gods#update'
  patch '/monsters/:id', to: 'monsters#update'

  delete '/gods/:id', to: 'gods#destroy'
  delete '/monsters/:id', to: 'monsters#destroy'
end

