Rails.application.routes.draw do
  
  devise_for :customers,skip: [:passwords], controllers:{
   registrations:"public/registrations",
   sessions:'public/sessions'
  }
  
  devise_for :admin,skip: [:registrations,:passwords], controllers:{
   sessions:"admin/sessions"
  }
  
   root to: 'public/homes#top'
   get '/about' => "homes#about"
   get 'customers/show'
   get 'customers/edit'
   get 'customers/unsubscribe'
   
   get '/admin' => 'admin/homes#top'
  
  namespace :admin do
   resources :genres,only:[:index,:create,:edit,:update]
   resources :items,except:[:destroy]
   resources :customers,only:[:index,:show,:edit,:update]
   resources :orders,only:[:show,:update]
   resources :order_datails,only:[:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
