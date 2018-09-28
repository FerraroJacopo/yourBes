Rails.application.routes.draw do
  
  #devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',registrations: 'users/registrations' }

 get '/home', to: 'home#new'
 get '/admin_page', to: 'admin_page#new' 
 get '/users/admin_page', to: 'admin_page#new' 
 put 'admin_page/up', to: 'admin_page#up'


 devise_scope :user do
  authenticated :user do
    root 'home#new', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
  
end

end
