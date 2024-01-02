ActiveAdmin.register Leave do
  permit_params :admin_user_id, :status, :description

  index do
    selectable_column
    id_column
    column :staff do |leave|
      admin_user = AdminUser.find_by(id: leave.admin_user_id)
      admin_user.email if admin_user
    end
    column :status
    column :description
    if current_admin_user.admin? 
      actions
    end
  end

  show do
    attributes_table do
      row :staff do |leave|
        admin_user = AdminUser.find_by(id: leave.admin_user_id)
        admin_user.email if admin_user
      end
      row :status
      row :description
    end
  end

  form do |f|
    f.inputs 'Leave Details' do
      f.input :admin_user_id, as: :select, collection: AdminUser.pluck(:email, :id)
      f.input :status
      f.input :description
    end
    f.actions
  end

  controller do
    def scoped_collection
      if current_admin_user.admin?
        Leave.all
      else
        Leave.where(admin_user_id: current_admin_user.id)
      end
    end
  end
end



