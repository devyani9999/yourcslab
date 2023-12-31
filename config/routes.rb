Rails.application.routes.draw do

  # devise_for :users
  devise_scope :user do
    # Redirects signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: "users/passwords",
    omniauth_callbacks: 'users/omniauth_callbacks',

  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get "/details", to: "home#details"
  get "/enrol_now/:course_id", to: "home#enrol_now", as: :enrol_now
  get "/contact", to: "home#contact", as: :contact
  post "/contact", to: "home#submit_contact_query", as: :submit_contact_query


  resources :courses
  get "/course_details", to: "courses#details"
  post "/enrol", to: "courses#enrol", as: :enrol
  get "/users/:id/dashboard", to: "users_home#dashboard", as: :user_dashboard
  get "/users/:id/dashboard", to: "users_home#dashboard", as: :users_root

  get "/users/:id/profile", to: "users_home#get_profile", as: :get_user_profile
  post "/users/:id/profile", to: "users_home#update_profile", as: :update_user_profile
  end
