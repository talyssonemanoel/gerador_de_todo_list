Rails.application.routes.draw do
  resources :lists do
    resources :items, only: [:create, :update, :destroy]
  end
  root 'lists#index'
  delete 'lists/:id', to: 'lists#destroy', as: 'list_delete'
  delete 'lists/:list_id/items/:id/delete', to: 'items#destroy', as: 'delete_list_item'
end


