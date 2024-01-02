class CreateLeaves < ActiveRecord::Migration[6.1]
  def change
    create_table :leaves do |t|
      t.integer :status
      t.references :admin_user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
