Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  constraints RoleRouteConstraint.new { |user| user.type == "ProjectManager" } do
    root to: 'project_managers#dashboard'
    get 'dashboard', to: 'project_managersr#dashboard'
  end
  constraints RoleRouteConstraint.new { |user| user.type == "Developer" } do
    root to: 'developers#dashboard'
    get 'dashboard', to: 'developers#dashboard'
  end

  resources :projects do
    resources :project_members
    resources :todos
  end

end
