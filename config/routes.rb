Rails.application.routes.draw do
  mount ShopifyApp::Engine, at: '/'

  scope "/api", constraints: { format: 'json' } do
    get 'settings/info'
  end

  namespace :api do
    namespace :v1 do
      get 'info' => "shop_settings#info"
      get 'settings' => "shop_settings#settings"
      get 'shops' => "shop_settings#shops"
      get 'questions' => "shop_settings#questions"
      get 'contacts' => "shop_settings#contacts"
      get 'customers' => "shop_settings#customers"
    end
  end

  get 'settings' => "settings#index"
  post 'settings' => "settings#create_or_update"
  get  'contact' => "contact#new"
  post 'contact' => "contact#create"
  post 'home_contact' => "contact#home_contact"

  root :to => 'recurring_application_charges#create'
  #root :to => 'questions#index'
  # For details on the DSL available within this file, see h
  get '/scripttag/', to: 'script_tag#index'
  get 'modal' => "home#modal", :as => :modal
  get 'modal_buttons' => "home#modal_buttons", :as => :modal_buttons
  get 'form_page' => "home#form_page"
  post 'form_page' => "home#form_page"
  post 'answer_mark' => "questions#answer_mark"
  post 'add_answer' => "questions#add_answer"
  get "get_answers" => 'questions#get_answers'
  get "reload_answers/:question_id" => 'questions#reload_answers'
  get 'all_questions' => "questions#index"
  get 'unanswered_questions' => "questions#unanswered_questions"
  get 'answered_questions' => "questions#answered_questions"
  get 'pagination' => "home#pagination"
  get 'breadcrumbs' => "home#breadcrumbs"
  get 'buttons' => "home#buttons"
  resources :questions

  resource :recurring_application_charge, only: [:create, :destroy] do
    collection do
      get :callback
      post :customize
    end
  end
end
