Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers:{
   registrations:"public/registrations",
   sessions:'public/sessions'
  }
  
  devise_for :admin,skip: [:registrations,:passwords], controllers:{
   sessions:"admin/sessions"
  }
  
   root :to => 'homes#top'
   get '/about' => "homes#about"
  
  
  namespace :admin do
   get '/about' => 'homes#top'
   resources :genres,only:[:index,:create,:edit,:update]
   resources :items,except:[:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
