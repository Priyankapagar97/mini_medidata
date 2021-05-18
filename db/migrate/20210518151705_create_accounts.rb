class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.belongs_to :subject
      t.string :account_no
      t.timestamps
    end
  end
end
