class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :title

      t.timestamps null: false
    end
    
    add_reference :names, :nameable, polymorphic: true, index:true

    remove_column :patients, :name_first
    remove_column :patients, :name_last
  end
end
