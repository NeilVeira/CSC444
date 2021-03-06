
Rails.application.routes.draw do

  get 'contact_us/index'
  get 'partner/index'
  get 'story/index'
  get 'faq/index'
  get 'feature/index'
  get 'site_map/index'
  get 'privacy/index'
  get 'serviceterm/index'

  get 'tickets/payment/:id', to: 'tickets#payment', as: :payment
  get 'tickets/check_in/:id', to: 'tickets#check_in', as: :checkIn
  # setup is used to pass the tournament_id to the tickets#new action when registering
  get 'tickets/setup/:id', to: 'tickets#setup', as: :setup

  # pass in ticket id
  get 'credit_cards/paymentProcessing/:id/:cc', to: 'credit_cards#paymentProcessing', as: :paymentProcessing
  
  get 'tickets/paypal_pay/:id', to: 'tickets#paypal_pay', as: :paypal_pay
  post 'paypal_paid', to: "paypal_notifications#create"

  # for teams
  post 'tournaments/:id/create_new_teams_for_tournament', to: 'tournaments#create_new_teams_for_tournament'
  post 'tournaments/:id/add_self_to_team', to: 'tournaments#add_self_to_team'
  post 'tournaments/:id/create_new_team', to: 'tournaments#create_new_team'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions', registrations: 'users/registrations', sign_out: 'users/sign_out'}
  get 'home_page/index'
  post 'home_page/index', to: 'home_page#index'
  get 'people/profile', to: 'people#profile'
  get 'people/portal', to: 'people#portal'
  get 'people/user_tourney', to: 'people#user_tourney'
  get 'people/sponsored', to: 'people#sponsored'
  get 'people/organized', to: 'people#organized'
  get 'people/user_ticket', to: 'people#user_ticket'
  get 'people/address', to: 'people#address'
  get 'people/linked_services', to: 'people#linked_services'
  get 'people/payment_information', to: 'people#payment_information'

  get 'tournaments/:id/dashboard', to: 'tournaments#dashboard', as: 'dashboard'
  get 'tournaments/:id/players', to: 'tournaments#view_players', as: 'view_players'
  get 'tournaments/:id/sponsors', to: 'tournaments#view_sponsors', as: 'view_sponsors'
  get 'tournaments/:id/tournament_organizers', to: 'tournaments#view_tournament_organizers', as: 'view_tournament_organizers'
  get 'tournaments/:id/check_in', to: 'tournaments#view_checked_in', as: :view_checked_in
  get 'tournaments/:id/reports', to: 'tournaments#view_reports', as: :view_reports
  get 'tournaments/:id/tee_sheets', to: 'tournaments#tee_sheets', as: :tee_sheets

  delete 'tournaments/:id/:ph_id', to: 'tournaments#remove_person_from_tournament', as: 'remove_person_from_tournament'
  
  resources :people
  resources :tournaments
  resources :golf_courses
  resources :tickets
  resources :teams
  resources :tournament_organizers
  resources :golf_course_organizers
  resources :website_admins
  resources :players
  resources :sponsors
  resources :credit_cards
  resources :paypal_notifications

  root 'home_page#index'
  
  get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
