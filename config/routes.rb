Rails.application.routes.draw do
  devise_for :users
 
 root 'posts#index'
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # searchの先にクリックしたタグ名のページを作り、そのリンクのパス名を’search’とする。
  get "posts/search/:category" => "posts#search",as: 'search'

  get "user_infos/new" => "user_infos#new"
 
 resources :posts do
 	resources :post_images
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
