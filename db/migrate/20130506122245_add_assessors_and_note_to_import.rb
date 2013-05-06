class AddAssessorsAndNoteToImport < ActiveRecord::Migration
  def change
    change_table :imports do |t|
      t.string :assessors
      t.text :notes
    end
  end
end
