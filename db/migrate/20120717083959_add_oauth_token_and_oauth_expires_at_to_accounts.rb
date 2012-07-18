class AddOauthTokenAndOauthExpiresAtToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :oauth_token, :string
    add_column :accounts, :oauth_expires_at, :datetime
    add_index :accounts, :oauth_token
  end
end
