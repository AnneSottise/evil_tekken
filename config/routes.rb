Rails.application.routes.draw do
  root 'fights#new'

  resources :characters, :weapons, :fights
end
