class CreateTabelas < ActiveRecord::Migration
  def change
    create_table :tabelas do |t|
      t.string :name, :limit => 150, :null => false
      t.boolean :active, :default => 1
      t.string :filter, :limit => 3
      t.integer :project_id
      t.integer :lock_version, :default => 0, :null => false
      
      t.timestamps
    end
  end
end
