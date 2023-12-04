## enjoy_db_migrate_seeds

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
genres = %w(
    編集
    人体
    線画
    カラー
    色
    資料
  )
  
genres.each do |name|
  Genre.create!(name: name)
end

Admin.create!(
    ## "任意のメールアドレス"[,]も忘れずに
  email: "abc@001",
    ## "任意のパスワード"
  password: "000001"
)

first_customer = Customer.create!(                                                                 
 :email=>"abc@007",                                                             
 :password=>"password",                                               
 :last_name=>"福原",                                                            
 :first_name=>"恭平",                                                           
 :last_name_kana=>"フクハラ",                                                   
 :first_name_kana=>"キョウヘイ",                                                
 :nickname=>"ラッキー",                                                         
 :birth_day=>"1997.0707"
)

if Rails.env.development?
  genre_ids = Genre.ids
  
  (1..10).each do |i|
    first_customer.illustrations.create!(
      genre_id: genre_ids.sample,                                                  
      name: "title_#{i}",                                  
      introduction: "text" * rand(1..10),                                                
    )
  end
  
  (1..10).each do |i|
    customer = Customer.create!(
      :email=>"user@00#{i}",                                                             
      :password=>"password",                                               
      :last_name=>"ユーザー#{i}",                                                            
      :first_name=>"ユーザー#{i}",                                                           
      :last_name_kana=>"ユーザー#{i}",                                                   
      :first_name_kana=>"ユーザー#{i}",                                                
      :nickname=>"nickname#{i}",                                                         
      :birth_day=>"1997.0#{i}01"
    )
    rand(0..2).times do |i|
      customer.illustrations.create!(
        genre_id: genre_ids.sample,                                                  
        name: "title_#{customer.last_name}_#{i}",                                  
        introduction: "text" * rand(1..10),                                                
      )
    end
  end
end

