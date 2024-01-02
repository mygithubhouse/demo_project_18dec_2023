class AddDescriptionToLeaves < ActiveRecord::Migration[6.1]
  def change
    add_column :leaves, :description, :string
  end
end
