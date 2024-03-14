class Review < ApplicationRecord
  ## 表示,削除,アップロードするメソッドを生成
  has_one_attached :image
  ## ユーザーに:～属する 1:N の関係 [N]側 受け
  ## Comment は :customer------------1:Nの N 側に当たる
  ## Comment は :sample_illustration 1:Nの N 側に当たる
  belongs_to :customer
  belongs_to :sample_illustration
end
