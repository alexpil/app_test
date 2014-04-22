class AddUniquenessToUniqueIdColumn < ActiveRecord::Migration
  def change
    add_index :tasks, :unique_id, unique: true
  end
end
