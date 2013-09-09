class AddMidtermStorageLocationToRecord < ActiveRecord::Migration
  def change
    change_table :records do |t|
      t.string :midterm_storage_location
    end
  end
end
