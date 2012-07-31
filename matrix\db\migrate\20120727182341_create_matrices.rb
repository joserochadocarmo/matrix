class CreateMatrices < ActiveRecord::Migration
  def change
    create_table :matrices do |t|
      t.integer :case_id
      t.integer :tabela_id
      t.string :crud, :limit => 4
      t.integer :lock_version, :default => 0, :null => false

      t.timestamps
    end
  end
end
