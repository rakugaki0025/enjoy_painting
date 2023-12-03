class Public::HomesController < ApplicationController
  ## enjoy_homes_controller_pablic
  
    ## 顧客_トップページ_root_path
  def top
      @illustrations = Illustration.all
      @illustrations = @illustrations.where(genre_id: params[:genre_id]) if params[:genre_id].present?
      @illustrations = @illustrations.where('name LIKE(?)', "%#{params[:name]}%") if params[:name].present?
      @illustrations = @illustrations.order(created_at: :desc).page(params[:page]).per(6)
  end
  
  
    ## 顧客_アバウトページ_about_path
  def about
  
  end
  
  
end
