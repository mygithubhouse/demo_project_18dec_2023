class UserMailer < ApplicationMailer
    def welcome_email(adminuser)
        @user = adminuser
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end
