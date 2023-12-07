class Illustration < ApplicationRecord
  
    ## 表示,削除,アップロードするメソッドを生成
  has_one_attached :image
    
    ## ユーザーに:～属する 1:N の関係 [1] 側 送信
    ## illustration は nice __ に 対して 1:多 の関係である
    ## illustration は comment に 対して 1:多 の関係である
    ## 削除機能
    ## たくさん持っている:モデルが 1:N になるよう関連付け:削除
  has_many :nice, dependent: :destroy
  has_many :comments, dependent: :destroy
    
  
    ## ユーザーに:～属する 1:N の関係 [N]側 受け
    ## illustration は :customer 1:Nの N 側に当たる
    ## illustration は :genre ___1:Nの N 側に当たる
  belongs_to :customer
  belongs_to :genre
  
    ## いいねする会員がいるか？
  def nice_by?(customer)
      
      nice.exists?(customer_id: customer.id)
  end
  
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
  
    ## プロフィール画像を許可
  has_one_attached :profile_image
    
    ## プロフィール画像を取得？
    ## ActiveStorageに格納したno_image画像(D)を表示する
  def get_profile_image(width, height)
    
      unless profile_image.attached?
        
        file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      
        profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      
      end
      
      profile_image.variant(resize_to_limit: [width, height]).processed
      ## profile_image.variant(resize_to_limit: [100, 100]).processed
    
  end
  
end
