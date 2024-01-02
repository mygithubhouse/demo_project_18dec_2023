ActiveAdmin.register AdminUser do
  role_changeable
  permit_params :email, :password, :password_confirmation, :role, :department_id

  index do
    selectable_column
    id_column
    column :email
    column :department_id do |obj|
      department = Department.find_by(id: obj.department_id)
      department.department_name if department
    end
    column :role 
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role
      f.input :department, as: :select, collection: Department.where.not(department_name: 'admin').map{ |a| [a.department_name, a.id] }
    end
    f.actions
  end

end
