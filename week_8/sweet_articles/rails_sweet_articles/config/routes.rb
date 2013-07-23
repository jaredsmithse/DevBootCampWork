RailsSweetArticles::Application.routes.draw do
  root :to => 'home#index'

  resources :categories do
  	resources :articles
  end
  

  match '/articles/:month/:day/:year/:id', to: "articles#show"

end
