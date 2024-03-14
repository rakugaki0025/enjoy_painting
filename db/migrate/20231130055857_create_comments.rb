class CreateComments < ActiveRecord::Migration[6.1]
  ## enjoy_db_migrate_comments


  def change
    create_table :comments do |t|
      ## 追加
      t.integer :customer_id, null: false          # t.データ型 :カラム名, null: false
      t.integer :illustration_id, null: false      # t.データ型 :カラム名, null: false
      t.text :content, null: false                 # t.データ型 :カラム名, null: false

      ## 初回生成される created_at, updated_at
      t.timestamps
    end
  end
end
