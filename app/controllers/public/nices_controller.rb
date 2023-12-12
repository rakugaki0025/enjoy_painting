class Public::NicesController < ApplicationController
    ## enjoy_controller_public_nices
    
    ## いいね機能
  def create
        ## いいねした画像のIDを取得
      illustration = Illustration.find(params[:illustration_id])
        ## ログインユーザーが,いいねした会員の画像とID特定
      nice = current_customer.nices.new(illustration_id: illustration.id)
        ## いいねセーブ
      nice.save
        ## 遷移先 いいねした画像のshowへ
      redirect_to illustration_path(illustration)
      
  end
  
    ## いいね_削除機能
  def destroy
        ## いいねした画像のIDを取得
      illustration = Illustration.find(params[:illustration_id])
        ## ログインユーザーが,いいねした会員の画像とID特定
      nice = current_customer.nices.find_by(illustration_id: illustration.id)
        ## いいね削除
      nice.destroy
        ## 遷移先 いいねした画像のshowへ
      redirect_to illustration_path(illustration)
      
  end
  
    ## いいね＿一覧(ブックマーク)
  def index
        ## 全イラストデータ取得
      @illustrations = Illustration.all
        ## ログインユーザーが,いいねした会員の画像とID特定
      @illustrations = current_customer.nice.new(illustration_id: illustration.id)
       ## 作成日時の降順に並び替え,6件ずつ表示
      @illustrations = @illustrations.order(created_at: :desc).page(params[:page]).per(6)
       p"0000000000000000000"
       @illstrations
  end
  
  
end

