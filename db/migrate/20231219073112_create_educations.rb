class CreateEducations < ActiveRecord::Migration[6.1]
  def change
    create_table :educations do |t|
      t.references :admin_user, null: false, foreign_key: true
      t.string :qualification
      t.string :institute_name
      t.date :start_year
      t.date :end_year
      t.string :specialization

      t.timestamps
    end
  end
end
