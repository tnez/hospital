class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.text :description
      t.belongs_to :patient, index: true
      t.timestamps null: false
    end
  end
end
