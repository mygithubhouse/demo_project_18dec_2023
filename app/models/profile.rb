class Profile < ApplicationRecord
  belongs_to :department
  belongs_to :admin_user
  mount_uploader :profile_picture, ProfilePictureUploader

end
