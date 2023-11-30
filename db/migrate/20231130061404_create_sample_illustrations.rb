class CreateSampleIllustrations < ActiveRecord::Migration[6.1]
  ## enjoy_db_migrate_sample_illustrations
  
  
  def change
    create_table :sample_illustrations do |t|
      
        ## 追加
      t.integer :genre_id, null: false             # t.データ型 :カラム名, null: false
      t.string :name, null: false                  # t.データ型 :カラム名, null: false
      t.text :introduction, null: false            # t.データ型 :カラム名, null: false
      
        ## 初回生成される created_at, updated_at
      t.timestamps
    end
  end
end
