# class LeaveMailer < ApplicationMailer
#     def welcome_leave(leave)
#       @leave = leave
#       mail(to: @leave.admin_user_id, subject: 'Welcome to My Awesome Site')
#     end
# end

# class LeaveMailer < ApplicationMailer
#   def welcome_leave(leave)
#     @leave = leave
#     admin_user = AdminUser.find_by(id: @leave.admin_user_id)

#     if admin_user
#       mail(to: admin_user.email, subject: 'Welcome to My Awesome Site')
#     else
#       Rails.logger.error("Admin user with ID #{@leave.admin_user_id} not found.")
#     end
#   end
# end

class LeaveMailer < ApplicationMailer
  def welcome_leave(leave)
    @leave = leave
    admin_user = AdminUser.find_by(id: @leave.admin_user_id)

    if admin_user
      mail(to: admin_user.email, subject: 'Welcome to My Awesome Site')
    else
      # Handle the case when the admin user is not found
      # You can raise an error, log a message, or handle it based on your requirements
      # For example:
      Rails.logger.error("Admin user with ID #{@leave.admin_user_id} not found.")
    end
  end

  def leave_approved_notification(user)
    @user = user
    mail(to: @user.email, subject: 'Your Leave Request has been Approved')
  end
end
