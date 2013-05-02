class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :file
      t.integer :record_id
      t.timestamps
    end
  end
end
