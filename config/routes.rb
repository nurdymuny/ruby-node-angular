Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#edit', via: [:get]
  match "xmlformat" => "home#xmlformat", as: :xml_format, via: [:get]

  resources :purchases do
  	member do
      get :xml_format
    end
  end
end
