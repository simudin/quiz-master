Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root to: 'features#dashboard'
  get 'features/dashboard'
  get 'features/quiz'
  get 'features/score'

  resources :questions do
    member do
      post :check_answer
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
