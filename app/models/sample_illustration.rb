class SampleIllustration < ApplicationRecord
    ## Enjoy_models_admin_sample_illustration
    
    ## 表示,削除,アップロードするメソッドを生成
  has_one_attached :image
  
  
    ## 必須入力にする設定
  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  
  
    ## ユーザーに:～属する 1:N の関係 [1] 側 送信
    ## sample_illustration は review に 対して 1:多 の関係である
    ## 削除機能
    ## たくさん持っている:モデルが 1:N になるよう関連付け:削除
  has_many :reviews, dependent: :destroy
  
    ## ユーザーに:～属する 1:N の関係 [N]側 受け
    ## sample_illustration は :admin 1:Nの N 側に当たる
    ## sample_illustration は :genre 1:Nの N 側に当たる
  belongs_to :admin
  belongs_to :genre
  
  
  
    ## ActiveStorageに格納したno_image画像(D)を表示する
  def get_image
        
        ## サンプル画像を載せる記述
    unless image.attached?
        ## サンプル画像を載せる記述
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
        ## 
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
        ## 全ての画像サイズを変更する
      # image.variant(resize_to_limit: [360, 300]).processed
        ## 記述がないと目的を果たせない(画像)get_image依存
      image
        
  end
  
  
  def star
      
      
      
  end
  
  
end

