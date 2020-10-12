Rails.application.routes.draw do
  root 'main#board'
  get '/airplanes/:id', to: 'main#airplane'
  get '/airplanes/:id/launch', to: 'main#launch'
end
