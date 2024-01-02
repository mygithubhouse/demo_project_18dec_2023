ActiveAdmin.register Education do
  
  permit_params :admin_user_id, :qualification, :institute_name, :start_year, :end_year, :specialization
 
  actions :all

  index do
    selectable_column
    id_column
    column :staff do |education|
      admin_user = AdminUser.find_by(id: education.admin_user_id)
      admin_user.email if admin_user
    end
    column :qualification
    column :institute_name
    column :start_year
    column :end_year
    column :specialization
    if !current_admin_user.admin? 
      actions
    end
  end
 
  show do
    attributes_table do
      row :staff do |education|
        admin_user = AdminUser.find_by(id: education.admin_user_id)
        admin_user.email if admin_user
      end
      row :qualification
      row :institute_name
      row :start_year
      row :end_year
      row :specialization
    end
  end

  form do |f|
    f.inputs 'Education Details' do
      f.input :admin_user_id, as: :select, collection: AdminUser.pluck(:email, :id)
      f.input :qualification
      f.input :institute_name
      f.input :start_year
      f.input :end_year
      f.input :specialization
    end
  end

  controller do
    def scoped_collection
      if current_admin_user.admin?
        Education.all
      else
        Education.where(admin_user_id: current_admin_user.id)
      end
    end
  end
end

