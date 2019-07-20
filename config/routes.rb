Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  post '/google/data', to: "main#google"
  post '/findTrip', to: "main#findTrips"
  post '/createTrip', to: "main#createTrips"
  get '/my_trips', to: "main#my_trips"
  get '/getTrip/:id', to: "main#get_trip"
  delete '/deleteTrip', to: "main#delete_trip"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
