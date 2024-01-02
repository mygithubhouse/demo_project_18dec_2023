class AddAdminUserToEmployeeTypes < ActiveRecord::Migration[6.1]
  def change
    add_reference :employee_types, :admin_user, null: false, foreign_key: true
  end
end
