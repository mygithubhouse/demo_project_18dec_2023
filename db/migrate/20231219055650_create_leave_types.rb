class CreateLeaveTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :leave_types do |t|
      t.string :leave_type

      t.timestamps
    end
  end
end
