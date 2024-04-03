# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # the default route
  root 'landing#index'

  # login & protected page
  get 'login' => 'sessions#index'
  get 'profile' => 'profile#index'
  get 'dashboard' => 'dashboard#index'

  # static pages have to be explicitly be mentioned due to the catch-all rule below
  get 'pages/about' => 'high_voltage/pages#show', id: 'about'
  get 'pages/help' => 'high_voltage/pages#show', id: 'help'
  get 'pages/imprint' => 'high_voltage/pages#show', id: 'imprint'
  get 'pages/privacy' => 'high_voltage/pages#show', id: 'privacy'

  # OAuth etc
  get 'auth/github/callback', to: 'sessions#create_github'
  get 'auth/discord/callback', to: 'sessions#create_discord'
  get 'auth/google_oauth2/callback', to: 'sessions#create_google'
  get '/logout', to: 'sessions#logout'

  # catch all
  match '*unmatched', to: 'errors#page_not_found', via: :all
end
