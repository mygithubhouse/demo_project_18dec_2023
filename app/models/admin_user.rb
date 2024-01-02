class AdminUser < ApplicationRecord
  after_create :send_welcome_email
  role_based_authorizable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  
         belongs_to :department
         has_many :educations
         has_many :profiles
         has_many :staff_experiences
         has_many :attendances
         has_many :leaves
         has_one :employee_types

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end


  