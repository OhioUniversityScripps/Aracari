class CreateImports < ActiveRecord::Migration
  def up
    create_table :imports do |t|
      t.timestamps
    end
  end

  def down
    drop_table :imports
  end
end
