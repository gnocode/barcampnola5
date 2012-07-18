class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title, default: nil
      t.text :body, default: nil
      t.date :start_at
      t.date :end_at
      t.string :uri, default: nil
      t.string :media, default: nil
      t.belongs_to :account

      t.timestamps
    end
    add_index :entries, :title
    add_index :entries, :start_at
    add_index :entries, :end_at
    add_index :entries, :uri
    add_index :entries, :media
    add_index :entries, :account_id
  end
end
