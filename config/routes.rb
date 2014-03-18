D3Visualizer::Application.routes.draw do
  resources :carriers, :only => [:index, :show]
  root "carriers#index"
  resources :delays, :only => [:index]

end
