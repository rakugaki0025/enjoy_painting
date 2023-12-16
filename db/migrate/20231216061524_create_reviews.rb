class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      
        ## 追加
      t.integer :customer_id, null: false          # t.データ型 :カラム名, null: false
      t.integer :sample_illustration_id, null: false          # t.データ型 :カラム名, null: false
      
        ## 初回生成される created_at, updated_at
      t.timestamps
    end
  end
end
