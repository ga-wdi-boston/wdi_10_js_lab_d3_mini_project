D3Visualizer::Application.routes.draw do
  root "employees#index"
  get "employees/index" # need BOTH of these!
end
