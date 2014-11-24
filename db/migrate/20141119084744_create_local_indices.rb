class CreateLocalIndices < ActiveRecord::Migration
  def change
    create_table :local_indices do |t|
      t.string  :nama
      t.string  :violence_id
    end
    add_index :local_indices, :violence_id
  end
end
