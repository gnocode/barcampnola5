class ChangeEntry < ActiveRecord::Migration
  def change
    remove_column :entries, :data
    add_column :entries, :date, :datetime
  end

end
