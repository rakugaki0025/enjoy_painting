class CreateGenres < ActiveRecord::Migration[6.1]
  ## enjoy_db_migrate_genres
  
  
  def change
    create_table :genres do |t|
      
        ## 追加
      t.string :name, null: false                  # t.データ型 :カラム名, null: false
      
        ## 初回生成される created_at, updated_at
      t.timestamps
    end
  end
end
