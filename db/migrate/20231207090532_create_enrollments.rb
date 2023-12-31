class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.references :user
      t.references :course
      t.datetime :start_date
      t.integer :price

      t.timestamps
    end
  end
end
