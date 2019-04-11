Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :pension_types
      resources :blood_types
      resources :attachments
      resources :skills
      resources :skill_types
      resources :skill_detail_types
      resources :health_insurance_types
      resources :user_skills
      resources :organization_belongs
      resources :organizations
      resources :employment_pattern_types
      resources :employment_insurance_types
      resources :permission_types
    end
  end

  namespace :v1 do
    resources :records
    resources :status_change_event
  end
end
