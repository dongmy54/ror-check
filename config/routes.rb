Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :questions do
    collection do
        get  :current_error
        get  :all_error
        get  :already_published
    end
  end

  resources :answer_records
  resources :exams do
  	collection do
  	    post :result
        post :start_test
  	end
  end

  namespace :admin do
     resources :questions
  end

get "/direct_login" => "questions#direct_login"

end
