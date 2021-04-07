Rails.application.routes.draw do
  resources :kittens

  root to: redirect('/kittens')
end
