class AddNameToCalendars < ActiveRecord::Migration[5.0]
  def change
    add_column :calendarupdates, :name, :string, null: false
  end
end
