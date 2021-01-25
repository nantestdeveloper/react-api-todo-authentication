Rails.application.routes.draw do
  get 'todos/index'
  get 'todos/create'
  get 'todos/update'
  get 'todos/destroy'
  scope '/api/v1' do
    resources :todos
    post 'authenticate', to: 'authentication#authenticate'
    get 'verifyToken', to: 'authentication#verifyToken'
    post 'signup', to: 'authentication#signup'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
