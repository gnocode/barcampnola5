class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :uid
      t.string :provider
      t.string :name
      t.string :email

      t.timestamps
    end
    add_index :accounts, :name
    add_index :accounts, :email
  end
end
