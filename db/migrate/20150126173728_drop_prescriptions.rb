class DropPrescriptions < ActiveRecord::Migration

  def up
    drop_table :prescriptions
  end

  def down
    create_table :prescriptions do |t|
      t.string :medication
      t.integer :patient_id
      t.timestamps null: false
    end
  end

end
