Rails.application.routes.draw do
  namespace :v1 do
    resources :records
    resources :status_change_event
  end
end
