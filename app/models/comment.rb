class Comment < ApplicationRecord
  
  
  
    ## 必須入力にする設定_text_fild等
  validates :content, presence: true
  
    ## ユーザーに:～属する 1:N の関係 [N]側 受け
    ## Comment は :admin--------1:Nの N 側に当たる
    ## Comment は :customer-----1:Nの N 側に当たる
    ## Comment は :illustration 1:Nの N 側に当たる
  belongs_to :customer
  belongs_to :illustration
  
  
end
