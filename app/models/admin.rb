class Admin < ApplicationRecord
  ## enjoy_models_admin
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    ## ユーザーに:～属する 1:N の関係 [1] 側 送信
    ## admin は genre _______ に 対して 1:多 の関係である
    ## admin は comment ______に 対して 1:多 の関係である
    ## ad は illustrations に 対して 1:多 の関係である
    ## 削除機能
    ## たくさん持っている:モデルが 1:N になるよう関連付け:削除
  has_many :genre, dependent: :destroy
    ## コメントを付けることはできなかったため…
  ## has_many :comment, dependent: :destroy
  has_many :sample_illustrations
  
  
  
end
