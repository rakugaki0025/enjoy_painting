class AddNicknameToCustomers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :customers, :nickname, true
  end
end
