ActiveAdmin.register Attendance do
    permit_params :admin_user_id, :status, :attendance_date
  
    index do
      selectable_column
      id_column
      column :staff do |attendance|
        admin_user = AdminUser.find_by(id: attendance.admin_user_id)
        admin_user.email if admin_user
      end
      column :status
      column :attendance_date
      actions
    end
  
    show do
      attributes_table do
        row :staff do |attendance|
          admin_user = AdminUser.find_by(id: attendance.admin_user_id)
          admin_user.email if admin_user
        end
        row :status
        row :attendance_date
      end
    end
  
    form do |f|
      f.inputs 'Attendance Details' do
        f.input :admin_user_id, as: :select, collection: AdminUser.pluck(:email, :id)
        f.input :status
        f.input :attendance_date
      end
      f.actions
    end
  
    controller do
      def scoped_collection
        if current_admin_user.admin?
          Attendance.all
        else
          Attendance.where(admin_user_id: current_admin_user.id)
        end
      end
    end
end
  