class Genre < ApplicationRecord
  ## Enjoy_models_admin_genre
  
    ## 必須入力にする設定
  validates :name, presence: true, uniqueness: true
  
    ## ユーザーに:～属する 1:N の関係 [1] 側 送信
    ## genre は sumple_illustration に 対して 1:多 の関係である
    ## genre は illustration________に 対して 1:多 の関係である
    ## 削除機能
    ## たくさん持っている:モデルが 1:N になるよう関連付け:削除
  has_many :sample_illustration, dependent: :destroy
  has_many :illustration, dependent: :destroy
    
    ## ユーザーに:～属する 1:N の関係 [N]側 受け
    ## genre は :admin__の 1:Nの N 側に当たる
  ## belongs_to :admin
  
  
  
  
end
