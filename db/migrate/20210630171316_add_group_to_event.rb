class AddGroupToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :group, :boolean, default: true
  end
end
