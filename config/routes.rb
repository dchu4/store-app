Rails.application.routes.draw do
  get '/' => 'products#index'
  get '/books' => 'products#index'

  get 'books/random' => 'products#random'
  get '/books/new' => 'products#new'
  post '/books' => 'products#create'

  get '/books/:id' => 'products#show'

  get '/books/:id/edit' => 'products#edit'
  patch '/books/:id' => 'products#update'

  delete '/books/:id' => 'products#destroy'

  get '/suppliers' => 'suppliers#index'

  get '/suppliers/new' => 'suppliers#new'
  post '/suppliers' => 'suppliers#create'

  get '/suppliers/:id' => 'suppliers#show'

  get '/suppliers/:id/edit' => 'suppliers#edit'
  patch '/suppliers/:id' => 'suppliers#update'

  delete '/suppliers/:id' => 'suppliers#destroy'
end
