DummyApp::Application.routes.draw do

  resources :projects

  root :to => 'rails_admin::Main#dashboard'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users

  #match "/pages/:id", :to => redirect("/page/%{id}")
  match ':controller(/:action(/:id(.:format)))'

end
