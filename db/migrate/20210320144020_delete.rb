class Delete < ActiveRecord::Migration[6.1]
  def change
    drop_table :transactions_groups
  end
end
