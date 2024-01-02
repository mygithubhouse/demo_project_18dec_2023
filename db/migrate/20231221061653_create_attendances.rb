class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.integer :status
      t.references :admin_user, null: false, foreign_key: true
      t.date :attendance_date, unique: true
    end
  end
end
