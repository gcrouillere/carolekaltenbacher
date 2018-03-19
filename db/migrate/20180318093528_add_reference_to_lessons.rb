class AddReferenceToLessons < ActiveRecord::Migration[5.0]
  def change
    add_reference :lessons, :calendarupdate, foreign_key: true
  end
end
