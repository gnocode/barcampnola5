class RenameTableEntriesMoments < ActiveRecord::Migration
  def change
    rename_table :entries, :moments
  end
end
