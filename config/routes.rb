Rails.application.routes.draw do
  scope module: :publics do
    get 'edit' => 'customers#edit'
    root to: 'homes#top'
    get 'about' => 'homes#about'
    devise_for :customers
    resources :items, :only => [:index, :show]
    get 'show' => 'customers#show'
    get 'unsubscribed' => 'customers#unsubscribed'
    patch 'update' => 'customers#update'
    patch 'withdraw' => 'customers#withdraw'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    # ↑順番を変えるのではなくasでも変更できる。　delete '/cart_items' => 'cart_items#delete_all', as: 'cart_items_destroy_all'
    resources :cart_items, :only => [:index, :create, :update, :destroy]
    resources :orders, :only => [:index, :show, :create, :new]
    resources :addresses, :only => [:index, :edit, :create, :update, :destroy]
    get 'thanks' => 'orders#thanks'
    get 'confirm' => 'orders#confirm'
    post 'confirm' => 'orders#confirm'
    get 'search' => 'searches#top'
  end
  
  devise_for :admins, :controllers => {
    :sessions => 'admin/sessions',
    :passwords => 'admin/passwords',
    :registrations => 'admin/registrations'
    }
  
  namespace :admin do
    root to: 'homes#top'
    resources :customers, :only => [:index, :show, :edit, :update]
    resources :genres, :only => [:index, :create, :edit, :update]
    resources :items
    resources :orders, :only => [:index, :show, :update]
    resources :order_details, :only => [:update]
    get 'search' => 'searches#search'
  end
end
