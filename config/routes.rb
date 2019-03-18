Rails.application.routes.draw do
  resources :organization_belongs
  resources :organizations
  resources :users
  namespace :v1 do
    resources :records
    resources :status_change_event
  end
end
