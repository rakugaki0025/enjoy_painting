Rails.application.routes.draw do
## enjoy_config_routes
  
  ## 顧客用
  ## URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
    
    ## 管理者用
    ## URL /admin/sign_in ...
    devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
 
  # scopeでは /public とは表示されない 例 /homes
  scope module: :public do
    
      ## root to設定で homes/topページ遷移設定
    root to: 'homes#top'
  
  end



    # namespaceでは /admin が表示される 例 /admin/homes
  namespace :admin do
    
      ## 管理者トップページ(注文履歴一覧)
      ## root to設定で admin_homes/topページ遷移設定
    root to: 'homes#top'
    
    
  end
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
