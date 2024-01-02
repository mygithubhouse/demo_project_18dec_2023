# ActiveAdmin.register EmployeeType do
   
#   permit_params :admin_user_id, :employee_type
  
#   index do
#     selectable_column
#     id_column
#     column :staff do |employeetype|
#       admin_user = AdminUser.find_by(id: employeetype.admin_user_id)
#       admin_user.email if admin_user
#     end
#     column :employee_type
#     actions
#   end
  
#   show do
#     attributes_table do
#       row :staff do |employeetype|
#         admin_user = AdminUser.find_by(id: employeetype.admin_user_id)
#         admin_user.email if admin_user
#       end
#       row :employee_type
#     end
#   end

#   form do |f|
#     f.inputs 'EmployeeType Details' do
#       f.input :admin_user_id, as: :select, collection: AdminUser.pluck(:email, :id)
#       f.input :employee_type
#     end
#     f.actions
#   end

#   controller do
#     def scoped_collection
#       if current_admin_user.admin?
#         EmployeeType.all
#       else
#         EmployeeType.where(admin_user_id: current_admin_user.id)
#       end
#     end
#   end
# end


ActiveAdmin.register EmployeeType do
   
  permit_params :admin_user_id, :employee_type
  
  index do
    selectable_column
    id_column
    column :staff do |employeetype|
      admin_user = AdminUser.find_by(id: employeetype.admin_user_id)
      admin_user.email if admin_user
    end
    column :employee_type
      if current_admin_user.admin? 
        actions
      end
  end
  
  show do
    attributes_table do
      row :staff do |employeetype|
        admin_user = AdminUser.find_by(id: employeetype.admin_user_id)
        admin_user.email if admin_user
      end
      row :employee_type
    end
  end

  form do |f|
    f.inputs 'EmployeeType Details' do
      f.input :admin_user_id, as: :select, collection: AdminUser.pluck(:email, :id)
      f.input :employee_type
    end
  end

  controller do
    def scoped_collection
      if current_admin_user.admin?
        EmployeeType.all
      else
        EmployeeType.where(admin_user_id: current_admin_user.id)
      end
    end
  end
end
