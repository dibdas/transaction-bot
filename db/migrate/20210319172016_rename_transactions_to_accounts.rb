class RenameTransactionsToAccounts < ActiveRecord::Migration[6.1]
  def change
    rename_table :transactions, :accounts
  end
end
