class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :target
      t.string :credit
      t.text :caption

      t.timestamps
    end
  end
end
