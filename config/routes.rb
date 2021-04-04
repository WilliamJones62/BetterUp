Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :coach_appointments, param: :client
    end
  end
  
  get 'coaches_csv/csv'
  resources :coaches_csv do
    collection { post :import}
  end
  get 'coach_appointments/main'
  resources :coach_appointments do

  end
  root 'coach_appointments#main'
end
