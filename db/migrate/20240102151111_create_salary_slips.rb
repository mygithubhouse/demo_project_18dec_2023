class CreateSalarySlips < ActiveRecord::Migration[6.1]
  def change
    create_table :salary_slips do |t|
      t.references :admin_user, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
