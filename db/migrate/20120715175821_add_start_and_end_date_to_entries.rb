class AddStartAndEndDateToEntries < ActiveRecord::Migration
  def change
    add_column :moments, :start_at, :date
    add_index :moments, :start_at
    add_column :moments, :end_at, :date
    add_index :moments, :end_at
  end
end
