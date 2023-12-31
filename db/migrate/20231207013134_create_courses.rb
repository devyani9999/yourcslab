class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.references :category
      t.string :name
      t.string :description
      t.string :details_link
      t.float :price
      t.float :discount

      t.timestamps
    end
  end
end
