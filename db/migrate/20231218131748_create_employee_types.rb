class CreateEmployeeTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_types do |t|
      t.string :employee_type

      t.timestamps
    end
  end
end
