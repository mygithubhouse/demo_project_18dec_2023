ActiveAdmin.register SalarySlip do
    permit_params :admin_user_id, :status
  
    index do
      selectable_column
      id_column
      column :staff do |salaryslip|
        admin_user = AdminUser.find_by(id: salaryslip.admin_user_id)
        admin_user.email if admin_user
      end
      column :status
      if current_admin_user.admin? 
        actions
      end
    end
  
    show do
      attributes_table do
        row :staff do |salaryslip|
          admin_user = AdminUser.find_by(id: salaryslip.admin_user_id)
          admin_user.email if admin_user
        end
        row :status
      end
    end
  
    form do |f|
      f.inputs 'Salaryslip Details' do
        f.input :admin_user_id, as: :select, collection: AdminUser.pluck(:email, :id)
        f.input :status
      end
      f.actions
    end
  
    controller do
      def scoped_collection
        if current_admin_user.admin?
          SalarySlip.all
        else
          SalarySlip.where(admin_user_id: current_admin_user.id)
        end
      end
    end
end
  
  
  
  