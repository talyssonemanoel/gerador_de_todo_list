Rails.application.routes.draw do
  resources :lists do
    resources :items, only: [:create, :update, :delete]
  end
  root 'lists#index'
  delete 'lists/:id', to: 'lists#destroy', as: 'list_delete'
  edit 'lists/:id', to: 'lists#edit', as: 'list_edit'
end

