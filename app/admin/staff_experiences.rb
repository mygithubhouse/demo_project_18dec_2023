ActiveAdmin.register StaffExperience do

 
   permit_params :total_experience, :admin_user_id
  
   index do
    selectable_column
    id_column
    column :admin_user do |obj|
      admin_user = AdminUser.find_by(id: obj.admin_user_id)
      admin_user.email if admin_user
    end
    column :total_experience
    if !current_admin_user.admin? 
      actions
    end
  end

  form do |f|
    f.inputs 'Staffexperience Details' do
      f.input :admin_user_id, as: :select, collection: AdminUser.pluck(:email, :id)
      f.input :total_experience
    end
    f.actions
  end
  
  controller do
    def scoped_collection
      if current_admin_user.admin?
        StaffExperience.all
      else
        StaffExperience.where(admin_user_id: current_admin_user.id)
      end
    end
  end
end
