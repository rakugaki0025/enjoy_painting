class Customer < ApplicationRecord
  ## enjoy_models_customer
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
    ## ユーザーに:～属する 1:N の関係 [1] 側 送信
    ## customer は nice--- に 対して 1:多 の関係である
    ## customer は comment に 対して 1:多 の関係である
    ## customer は illustration に 対して 1:多 の関係である
    ## 削除機能
    ## たくさん持っている:モデルが 1:N になるよう関連付け:削除
  has_many :nice, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :illustration
  
end
