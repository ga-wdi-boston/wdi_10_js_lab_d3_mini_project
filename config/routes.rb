D3Visualizer::Application.routes.draw do
  get  'countries/assistance'
  get  'countries/life_exp'
  get  'countries/econ'
  get  'countries/mil'
  root 'countries#assistance'
end
