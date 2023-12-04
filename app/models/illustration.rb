class Illustration < ApplicationRecord
  
    ## 表示,削除,アップロードするメソッドを生成
  has_one_attached :image
  
  belongs_to :customer
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
  
end
