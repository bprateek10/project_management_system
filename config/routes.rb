Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { invitations: 'invitations' }


  devise_scope :user do
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  constraints RoleRouteConstraint.new { |user| user.type == "ProjectManager" } do
    root to: 'project_managers#dashboard'
    get 'dashboard', to: 'project_managers#dashboard'
  end
  constraints RoleRouteConstraint.new { |user| user.type == "Developer" } do
    root to: 'developers#dashboard'
    get 'dashboard', to: 'developers#dashboard'
  end

  resources :project_managers do
    collection do
      get 'project_wise_data'
      get 'developer_wise_data'
    end
  end
  resources :projects do
    resources :project_members
    resources :todos
    member do
      get 'statistics'
    end
  end

end
