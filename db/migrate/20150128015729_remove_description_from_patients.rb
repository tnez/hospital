class RemoveDescriptionFromPatients < ActiveRecord::Migration
  def change
    remove_column :patients, :description, :text
  end
end
