class AddPriceToCalendarupdates < ActiveRecord::Migration[5.0]
  def change
    add_monetize :calendarupdates, :price, currency: { present: false }
  end
end
