class CreateEntriesTags < ActiveRecord::Migration
  def change
    create_table :entries_tags, id: false do |t|
      t.belongs_to :tag
      t.belongs_to :entry
    end
    add_index :entries_tags, :tag_id
    add_index :entries_tags, :entry_id
  end
end
