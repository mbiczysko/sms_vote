Rails.application.routes.draw do
  get 'welcome/index'
  get '/by_campaign/:campaign',  to: 'welcome#by_campaign'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
