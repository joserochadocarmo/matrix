class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, :limit => 100, :null => false
      t.boolean :active, :default => 1
      t.string :filter, :limit => 3
      t.integer :lock_version, :default => 0, :null => false

      t.timestamps
    end
  end
end
