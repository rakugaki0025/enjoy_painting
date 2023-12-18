class AddCustomerIdToSampleIllustrations < ActiveRecord::Migration[6.1]
  def change
    add_column :sample_illustrations, :Customer_id, :integer
  end
end
