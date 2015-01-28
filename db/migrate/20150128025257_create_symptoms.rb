class CreateSymptoms < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|
      t.text :description
      t.timestamps null: false
    end

    create_table :case_symptoms do |t|
      t.belongs_to :case, index: true
      t.belongs_to :symptoms, index: true
    end
  end
end
