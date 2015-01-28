class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.integer :noteable_id
      t.string :noteable_type
      t.timestamps null: false
    end
  end
end
