class CreateStaffExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :staff_experiences do |t|
      t.string :total_experience
      t.string :certificate
      t.references :admin_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
