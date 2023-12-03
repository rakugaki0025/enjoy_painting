class Post < ApplicationRecord
  
  
   ## 属性の定義
  attribute :title, :string
  attribute :content, :text
  attribute :genre_id, :integer
    ## 他の属性の定義...

    ## 関連の定義
  belongs_to :genre
    ## 他の関連の定義...
  
end

