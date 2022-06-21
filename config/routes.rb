Rails.application.routes.draw do
  get 'short_link_redirector/redirect'
  namespace :api do
    namespace :v1 do
      post 'short_urls', to: 'short_urls#create'
      get 'short_urls/:short_link_slug', to: 'short_urls#show'
    end
  end

  get '/:short_link_slug', to: 'short_link_redirector#redirect', as: :short_link_redirector

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
