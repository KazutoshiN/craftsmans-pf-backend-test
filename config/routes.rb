Rails.application.routes.draw do
  resources :blood_types
  resources :attachments
  resources :skills
  resources :user_skills
  resources :organization_belongs
  resources :organizations
  resources :users
  namespace :v1 do
    resources :records
    resources :status_change_event
  end
end
