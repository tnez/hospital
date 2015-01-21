class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name_first
      t.string :name_last
      t.date :date_of_birth
      t.text :description
      t.string :gender
      t.string :blood_type

      t.timestamps null: false
    end
  end
end
