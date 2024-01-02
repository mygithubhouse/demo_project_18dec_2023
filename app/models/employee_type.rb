class EmployeeType < ApplicationRecord
    belongs_to :admin_user
    validates :employee_type, presence: true
end
