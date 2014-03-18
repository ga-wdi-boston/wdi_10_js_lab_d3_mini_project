D3Visualizer::Application.routes.draw do
  resources :carriers, :only => [:index, :show]
  root "carriers#index"

end
