class Attendance < ApplicationRecord
  belongs_to :admin_user
  validates :attendance_date, uniqueness: { scope: :admin_user_id, message: "can only be recorded once per day" }
  enum status: { present: 0, absent: 1}
end
