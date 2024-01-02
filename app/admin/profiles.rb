ActiveAdmin.register Profile do

  
  permit_params :name, :contact, :address, :department_id, :admin_user_id, :profile_picture

  controller do
    def scoped_collection
      Profile.where(admin_user_id: current_admin_user.id)
    end
  end

  index do
    selectable_column
    id_column
    column :staff do |profile|
      admin_user = AdminUser.find_by(id: profile.admin_user_id)
      admin_user.email if admin_user
    end
    column :profile_picture do |user|
      if user.profile_picture.present?
        image_tag(user.profile_picture.url, height: '80')
      else
        # Provide a default image or a placeholder if the profile picture is not present
        image_tag('default_profile_picture.png', height: '50', alt: 'Default Profile Picture')
      end
    end
    column :name
    column :contact
    column :address
    column :department_id
    if !current_admin_user.admin? 
      actions
    end
  end

  form do |f|
    f.inputs 'Profile Details' do
      f.input :admin_user_id, as: :select, collection: AdminUser.pluck(:email, :id)
      f.input :name
      f.input :contact
      f.input :address
      f.input :department_id
      f.input :profile_picture, as: :file
    end
    f.actions
  end
end
