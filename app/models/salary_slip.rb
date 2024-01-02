class SalarySlip < ApplicationRecord
  belongs_to :admin_user
  validates :status, presence: true
  enum status: { Credited: 'Credited', Pending: 'Pending' }
end
