class ChangeTimeToEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :date
    add_column :events, :date, :datetime
  end
end
