class AddDepartmentReferenceToAdminUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :admin_users, :department
  end
end
