class Public::HomesController < ApplicationController
  ## enjoy_homes_controller_pablic
  
    ## 顧客_トップページ_root_path
  def top
        ## 全データ取得
      @illustrations = Illustration.all
      
        ## "genre_id"が存在_"params:genre_id"と一致,取得__present?が大事
      @illustrations = @illustrations.where(genre_id: params[:genre_id]) if params[:genre_id].present?
      
        ## さらに"name"が存在する場合は,名前"name"に"params:name"を部分一致させるデータのみ取得
      @illustrations = @illustrations.where('name LIKE(?)', "%#{params[:name]}%") if params[:name].present?
      
        ## 作成日時の降順に並び替え,6件ずつ表示
      @illustrations = @illustrations.order(created_at: :desc).page(params[:page]).per(6)
  end
  
  
    ## 顧客_アバウトページ_about_path
  def about
  
  end
  
  
end
