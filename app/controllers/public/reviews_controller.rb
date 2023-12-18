class Public::ReviewsController < ApplicationController
  ## Enjoy_cntroller_public_reviews
  
    ## 
  def create
        ## star 格納
      @review = Review.new(review_params)
      
        ## reviewを呼び出す記述
      @review.customer = current_customer
        
      @review.sample_illustration_id = params[:sample_illustration_id]
      
          ## 記録保存が成功すれば投稿詳細へ
     if @review.save
         
          ## 遷移先 サンプル投稿_詳細画面
        redirect_to sample_illustration_path(id: @review.sample_illustration_id)
        
     else ## 保存できなかった場合, :画像投稿フォーム再表示
     
        redirect_to sample_illustration_path(id: @review.sample_illustration_id)
        
        # @sample_illustration.all
        
        # render :show
          
     end
      
  end
  
  
    ## イラスト_投稿_情報更新する /illustration/:id
  def update
    
        ##アクセス制限
    ## is_matching_login_user
       
        ## インスタンス変数 = 商品_find 探す:単数でどれか一つ
        ## レコードを一つ取得？
    @review = Review.find(params[:id])
              
        ## サンプル情報 アップデート
    if  @review.update(review_params)
              
        ## flash[:notice] は 投稿が成功した時だけ表示
        ## エラーメッセージでは使わない
      flash[:notice] = "You have updated user successfully."
              
        ## インスタンス変数 = ユーザー_find 探す:単数でどれか一つ  user_path(@user.id)
        ## 遷移先 '/customer' customer_path(@user.id)
      redirect_to illustration_review_path(@review.id)
              
    else
      
        ## アクションを実行しない
      render :edit
        
    end
  end
  
  
    ## イラスト_画像_削除する(単体) illustration/:id
  def destroy
      
        ## データ(レコード)を一件取得
      @review = Review.find(params[:id])
        
        ## データ（レコード）を削除
      @review.destroy
      
        ## サンプル一覧画面へリダイレクト
      redirect_to illustrations_path
        
  end
  
  
  private
  
        ## 評価機能パラメータ
  def review_params
        
        ## params  formから送られてくるデータはparamsの中
        ## require 送信データからモデル名(ここでは:review)を指定し、データを絞り込み
        ## permit  requireで絞り込んだデータの中から、保存を許可するカラムを指定
        #require(:review)
        #params.permit(:star)
      params.require(:review).permit(:star)
  end
  
end
