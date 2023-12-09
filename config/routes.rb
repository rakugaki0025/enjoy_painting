Rails.application.routes.draw do
## enjoy_config_routes
  
    ## 顧客用
    ## URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
  }
  
      ## ゲストログイン用  
  devise_scope :customer do
    
      ## ゲストログイン
    post '/users/guest_sign_in' => 'public/sessions#guest_sign_in'
    
  end
    
    ## 管理者用
    ## URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
    ## scopeでは /public とは表示されない 例 /homes
  scope module: :public do
    
      ## root to設定で homes/topページ遷移設定
    root to: 'homes#top'
    
    
    
### public_customers
    
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get '/about' => "homes#about", as: 'about'
    
      ## 顧客詳細画面
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'customers/my_page' => "customers#show", as: 'customers_my_page'
    
      ## 顧客編集画面
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'customers/information/edit' => "customers#edit", as: 'information_edit'
    
      ## 顧客の update patch
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    patch 'customers/information' => "customers#update", as: 'information_update'
    
      ## 顧客の退会確認画面
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'customers/confirm' => "customers#confirm", as: 'confirm'
    
      ## 顧客の退会処理(ステータスの更新)
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    patch 'customers/withdrow' => "customers#withdrow", as: 'withdrow'
    
    
    
### public_illustrations
      
      ## show    : 顧客_投稿_詳細画面
      ## new     : 顧客_投稿_新規登録画面
      ## create  : 顧客_投稿_新規情報登録する
      ## index   : 顧客_投稿_一覧画面
      ## edit    : 顧客_投稿_編集画面
      ## update  : 顧客_投稿_情報更新する
      ## destroy : 顧客_投稿_削除する(単体)
      ## customer ディレクトリ ルーティング自動生成 onlyで(限定生成)
    resources :illustrations, only: [:show, :new, :index, :create, :edit, :update, :destroy] do
      
    ### public_nice
    
        ## destroy  : 取り消しする
        ## create   : いいね送信する
        ## いいね機能
      resource :nice, only: [:create, :destroy]
      
    ### public_comment
        
        ## create  : 削除する
        ## create  : コメントする
        ## コメント機能
      resources :comments, only: [:create, :destroy]
      
    end
    
      ## いいねブックマーク用
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get '/liked_illust' => "customers#liked_illustrations", as: :liked_illustrations
    
    
  end



    # namespaceでは /admin が表示される 例 /admin/homes
  namespace :admin do
    
      ## 管理者トップページ(注文履歴一覧)
      ## root to設定で admin_homes/topページ遷移設定
    root to: 'homes#top'
    
    
### admin_customers
    
      ## 顧客一覧画面 ?
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'customers' => "customers#index", as: 'customers'
    
      ## 顧客詳細画面
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'customers/:id' => "customers#show", as: 'customers_show'
    
      ## 顧客編集画面
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'customers/:id/edit' => "customers#edit", as: 'customers_edit'
    
      ## 顧客情報の登録
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    patch 'customers/:id' => "customers#update", as: 'customers_update'
    
    
### admin_sample_illustration
      
      ## new     : 管理者_投稿_新規登録画面
      ## create  : 管理者_投稿_新規情報登録する
      ## index   : 管理者_投稿_一覧画面
      ## show    : 管理者_投稿_詳細画面
      ## edit    : 管理者_投稿_編集画面
      ## update  : 管理者_投稿_情報更新する
      ## destroy : 管理者_投稿_削除する(単体)
      ## sample_illustration ディレクトリ ルーティング自動生成 onlyで(限定生成)
    resources :sample_illustration, only: [:new, :index, :show, :create, :edit, :update, :destroy]
    
### admin_genre
      
      ## new     : 
      ## create  : 管理者_ジャンル_新規登録する
      ## index   : 管理者_ジャンル_一覧画面,新規登録機能,編集機能
      ## edit    : 
      ## update  : 管理者_ジャンル_更新する
      ## destroy : 
      ## genre ディレクトリ ルーティング自動生成 onlyで(限定生成)
    resources :genre, only: [:new, :create, :index, :edit, :update]
  end
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
