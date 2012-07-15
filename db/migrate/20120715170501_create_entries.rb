class CreateEntries < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.string :title
      t.text :body
      t.datetime :data

      t.timestamps
    end
  end
end
