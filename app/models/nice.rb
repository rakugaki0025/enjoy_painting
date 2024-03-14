class Nice < ApplicationRecord
  ## ユーザーに:～属する 1:N の関係 [N]側 受け
  ## Nice は :customer_____1:Nの N 側に当たる
  ## Nice は :illustration 1:Nの N 側に当たる
  belongs_to :customer
  belongs_to :illustration

  ## customer_idとillustration_idの組み合わせが一意である確認,複数回現れないようにする
  validates :customer_id, uniqueness: { scope: :illustration_id }
end
