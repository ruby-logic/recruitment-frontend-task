Rails.application.routes.draw do
  get 'recruitments/chart_data'
  root to: 'recruitments#chart_data'
end
