class AddWorkflowStateToCases < ActiveRecord::Migration
  def change
    add_column :cases, :workflow_state, :string
  end
end
