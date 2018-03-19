class AddCapacityToCalendarupdates < ActiveRecord::Migration[5.0]
  def change
    add_column :calendarupdates, :capacity, :integer
  end
end
