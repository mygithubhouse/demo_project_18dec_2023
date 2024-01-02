class LeaveType < ApplicationRecord
    validates :leave_type, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "Only alphabets are allowed" }

end
