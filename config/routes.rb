Rails.application.routes.draw do
  get '/' => 'products#index'
  get '/books' => 'products#index'

  get '/books/new' => 'products#new'
  post '/books' => 'products#create'

  get '/books/:id' => 'products#show'

  get '/books/:id/edit' => 'products#edit'
  patch '/books/:id' => 'products#update'
end
