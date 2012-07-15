class ChangeEntry < ActiveRecord::Migration
  def up
    remove_column :data
    add_column :date, :datetime
  end

  def down
    remove_column :date
  end
end
