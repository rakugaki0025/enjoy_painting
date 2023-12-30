class Admin::SampleIllustrationController < ApplicationController
    ## Enjoy_cntroller_admin_sample_illustration
    
    
    ## 管理者_投稿_新規登録画面 new_admin_sample_illustration_path
  def new
     
        ## インスタンス変数 = モデル名 空オブジェクト 新規作成
        ## 左の箱に右を格納
        ## インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
      @sample_illustration = SampleIllustration.new
      
  end
  
    ## 管理者_投稿_新規情報登録する admin_sample_illustration_index_path
  def create
      
          ## genre_id, name, introduction, image 格納
      @sample_illustration = SampleIllustration.new(sample_illustration_params)
      
          ## adminを呼び出す記述
      @sample_illustration.admin = current_admin
      
          ## 記録保存が成功すれば投稿一覧へ
     if @sample_illustration.save
        
          ## flash[:notice] は 投稿が成功した時だけ表示
          ## エラーメッセージでは使わない
        flash[:notice] = "サンプル情報を投稿しました。"
         
          ## 遷移先 サンプル投稿_詳細画面
        redirect_to admin_sample_illustration_path(@sample_illustration.id)
          
     else ## 保存できなかった場合, :画像投稿フォーム再表示
        render :new
          
     end
      
  end
  
  
    ## 管理者_投稿_一覧画面 admin_sample_illustration_path
  def index
      
        ## 全サンプルイラストデータ取得
      @sample_illustration = SampleIllustration.all
      
        ## アソシエーションを利用して,"sample"を取得_作成日時の降順に並び替え,6件ずつ表示
      @sample_illustration = SampleIllustration.order(created_at: :desc).page(params[:page]).per(6)
      
  end
  
  
    ## 管理者_投稿_詳細画面 admin_sample_illustration_path
  def show
      
        ## 投稿した sample_illustoration :id を取得するレコード
      @sample_illustration = SampleIllustration.find(params[:id])
      
  end
  
  
    ## 管理者_投稿_編集画面 edit_admin_sample_illustration_path
  def edit
      
        ## 投稿した sample_illustoration :id を取得するレコード
      @sample_illustration = SampleIllustration.find(params[:id])
      
  end
  
    ## 管理者_投稿_情報更新する admin/sample_illustration/:id
  def update
    
        ##アクセス制限
    ## is_matching_login_user
       
        ## インスタンス変数 = 商品_find 探す:単数でどれか一つ
        ## レコードを一つ取得？
    @sample_illustration = SampleIllustration.find(params[:id])
              
        ## サンプル情報 アップデート
    if  @sample_illustration.update(sample_illustration_params)
              
        ## flash[:notice] は 投稿が成功した時だけ表示
        ## エラーメッセージでは使わない
      flash[:notice] = "サンプル情報を変更しました。"
              
        ## インスタンス変数 = ユーザー_find 探す:単数でどれか一つ  user_path(@user.id)
        ## 遷移先 '/customer' customer_path(@user.id)
      redirect_to admin_sample_illustration_path(@sample_illustration.id)
              
    else
      
        ## アクションを実行しない
      render :edit
        
    end
  end
  
  
    ## 管理者_画像_削除する(単体) admin/sample_illustration/:id
  def destroy
      
        ## データ(レコード)を一件取得
      @sample_illustration = SampleIllustration.find(params[:id])
        
        ## データ（レコード）を削除
      @sample_illustration.destroy
      
        ## サンプル一覧画面へリダイレクト
      redirect_to '/admin/sample_illustration'
        
  end
  
  
  
  private
  
        ## サンプル登録情報編集画面等で使用…
  def sample_illustration_params
        
        ## params  formから送られてくるデータはparamsの中
        ## require 送信データからモデル名(ここでは:item)を指定し、データを絞り込み
        ## permit  requireで絞り込んだデータの中から、保存を許可するカラムを指定
      params.require(:sample_illustration).permit(:genre_id, :name, :introduction, :image)
  end
  
end

