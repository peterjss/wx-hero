Heroappr1::Application.routes.draw do
  get "home", to:"home#index"
  get "welcome/index"
  post "welcome/login"
  get "welcome/index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'welcome#index'

  namespace :apps do
    resources :realtimes
  end

  #resources :messages

  get "wxs/io",  to: "wxs#auth"
  scope path: 'wxs/io', via: :post do
    #match 'wxs/io', to:  'wxs#reply_text', constraints: lambda {|request| request.params[:xml].nil? }
    match 'wxs/io', to:  'wxs#reply_text', constraints: lambda {|request| request.params[:xml].nil? && request.params[:xml][:MsgType] == 'text'}

    #match "wxs/io", to: "wxs#reply_image", constraints: lambda {|request| request.params[:xml] && request.params[:xml][:MsgType] == "text"}

    #match "message/io" => "message#reply_text", constraints: Weixin::Router.new("text")
    #match "message/io" => "message#reply_image", constraints: Weixin::Router.new("image")
    #match "message/io" => "message#reply_location", constraints: Weixin::Router.new("location")
    #match "message/io" => "message#reply_link", constraints: Weixin::Router.new("link")
    #match "message/io" => "message#reply_event", constraints: Weixin::Router.new("event")
    #match "message/io" => "message#reply_music", constraints: Weixin::Router.new("music")
    #match "message/io" => "message#reply_news", constraints: Weixin::Router.new("news")
    #match "message/io" => "message#reply_news", constraints: lambda {|r| r.params}
  end


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
