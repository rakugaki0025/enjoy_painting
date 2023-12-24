class Customer < ApplicationRecord
  ## enjoy_models_customer
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    ## 表示,削除,アップロードするメソッドを生成
  has_one_attached :image
  
    ## 必須入力にする設定_text_fild等
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :nickname, presence: true
  validates :birth_day, presence: true
  
  
    ## ユーザーに:～属する 1:N の関係 [1] 側 送信
    ## customer は nice-------- に 対して 1:多 の関係である
    ## customer は comment -----に 対して 1:多 の関係である
    ## customer は illustration に 対して 1:多 の関係である
    ## customer は review------ に 対して 1:多 の関係である
    ## 削除機能
    ## たくさん持っている:モデルが 1:N になるよう関連付け:削除
  has_many :nices, dependent: :destroy
    ## いいね(ブックマーク)関連付け
  has_many :nice_illustrations, through: :nices, source: :illustration
  has_many :comments, dependent: :destroy
  has_many :illustration
  has_many :review, dependent: :destroy
  
  
    ## ユーザーに:～属する 1:N の関係 [N]側 受け
    ## customer は :sample_illustration 1:Nの N 側に当たる
  belongs_to :sample_illustration, optional: true
  
    ## コメントnameを定義 <%= comment.customer.name %>
  def name
      last_name + " " + first_name
  end
  
  
  
  
    ## プロフィール画像を許可
  has_one_attached :profile_image
    
    ## プロフィール画像を取得？
    ## ActiveStorageに格納したno_image画像(D)を表示する
  def get_profile_image(width, height)

      unless profile_image.attached?
        
        file_path = Rails.root.join('app/assets/images/no_image.jpg')
      
        profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
      
      end
      
      #if email == 'guest@example.com'
       # profile_image
      #else
        profile_image.variant(resize_to_limit: [width, height]).processed
      #end
      ## profile_image.variant(resize_to_limit: [100, 100]).processed
    
  end
  
  def guest_user?
    email == 'guest@example.com'
  end
  
end
