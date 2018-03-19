class AddAvailableToCalendarupdates < ActiveRecord::Migration[5.0]
  def change
    add_column :calendarupdates, :available, :boolean
  end
end
