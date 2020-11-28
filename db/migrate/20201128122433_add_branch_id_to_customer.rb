class AddBranchIdToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :branch_id, :integer
    add_index :customers, :branch_id
  end
end
