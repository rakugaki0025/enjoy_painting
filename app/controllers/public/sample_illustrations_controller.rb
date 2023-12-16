class Public::SampleIllustrationsController < ApplicationController
    ## enjoy_controller_public_sample_illustrations_show用
    
    ## 管理者_顧客_投稿_詳細画面 sample_illustration_path
  def show
        ## 投稿した sample_illustoration :id を取得するレコード
      @sample_illustration = SampleIllustration.find(params[:id])
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


