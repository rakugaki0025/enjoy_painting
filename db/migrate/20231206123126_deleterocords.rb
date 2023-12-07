class Deleterocords < ActiveRecord::Migration[6.1]
  def change
    
      ## 消すときの方法
    drop_table :end_users
    drop_table :posts
    
  end
end
