class AddInstitutePositionAndToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :institute, :string
    add_column :users, :position, :string
  end
end
