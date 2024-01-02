class Leave < ApplicationRecord
    after_create :send_leave_email
    belongs_to :admin_user
    validates :status, presence: true
    enum status: { halfday: 0, fullday: 1}
    private

    def send_leave_email
        LeaveMailer.welcome_leave(self).deliver_now
    end
end
