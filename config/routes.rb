Rails.application.routes.draw do
 
  devise_for :customers,skip: [:passwords], controllers:{
   registrations:"public/registrations",
   sessions:'public/sessions'
  }
  
  devise_for :admin,skip: [:registrations,:passwords], controllers:{
   sessions:"admin/sessions"
  }
  
   root to: 'public/homes#top'
   get '/about' => 'public/homes#about'
   
   get '/customers/unsubscribe' => 'public/customers#unsubscribe',as:'unsubscribe_customer'
   get '/customers/:id' => 'public/customers#show',as:'customer'
   get '/customers/:id/edit' => 'public/customers#edit',as:'edit_customer'
   patch '/customers/:id' => 'public/customers#update',as:'update_customer'
   
   post '/addresses' => 'public/addresses#create',as:'create_address'
   get '/addresses/:id' => 'public/addresses#index',as:'addresses'
   get '/addresses/:id/edit' => 'public/addresses#edit',as:'edit_address'
   patch '/addresses/:id' => 'public/addresses#update',as:'address'
   delete '/addresses/:id' => 'public/addresses#destroy',as:'destroy_address'
   
   get '/items' => 'public/items#index',as:'items'
   get '/items/:id' => 'public/items#show',as:'item'
   
   get '/cart_items' => 'public/cart_items#index',as:'cart_items'
   post '/cart_items' => 'public/cart_items#create',as:'create_cart_item'
   delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all',as:'destroy_cart_items'
   patch '/cart_items/:id' => 'public/cart_items#update',as:'update_cart_item'
   delete '/cart_items/:id' => 'public/cart_items#destroy',as:'destroy_cart_item'
  
  namespace :admin do
   root to: 'homes#top'
   resources :genres,only:[:index,:create,:edit,:update]
   resources :items,except:[:destroy]
   resources :customers,only:[:index,:show,:edit,:update]
   resources :orders,only:[:show,:update]
   resources :order_datails,only:[:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
