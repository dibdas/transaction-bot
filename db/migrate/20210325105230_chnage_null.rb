class ChnageNull < ActiveRecord::Migration[6.1]
  def change
    change_column :accounts, :group_id, :bigint, null: true
  end
end
