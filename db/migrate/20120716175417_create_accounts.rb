class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, default: nil
      t.string :email, default: nil

      t.string :remember_me_token, default: nil
      t.datetime :remember_me_token_expires_at

      t.datetime :last_login_at, default: nil
      t.datetime :last_logout_at, default: nil
      t.datetime :last_activity_at

      t.string :unlock_token, default: nil
      t.integer :failed_logins_count, default: 0
      t.datetime :lock_expires_at

      t.string :uid
      t.string :provider

      t.timestamps
    end
    add_index :accounts, :name
    add_index :accounts, :email
    add_index :accounts, :remember_me_token
    add_index :accounts, :unlock_token
  end
end
