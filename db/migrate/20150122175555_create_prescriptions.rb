class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.string :medication
      t.integer :patient_id

      t.timestamps null: false
    end
  end
end
