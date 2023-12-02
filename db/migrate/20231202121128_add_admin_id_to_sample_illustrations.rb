class AddAdminIdToSampleIllustrations < ActiveRecord::Migration[6.1]
  def change
    add_column :sample_illustrations, :admin_id, :integer
  end
end
