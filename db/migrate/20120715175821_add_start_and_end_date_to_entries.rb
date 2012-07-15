class AddStartAndEndDateToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :start_at, :date
    add_index :entries, :start_at
    add_column :entries, :end_at, :date
    add_index :entries, :end_at
  end
end
