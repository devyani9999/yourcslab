class CreateContactFormQueries < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_form_queries do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :query_text

      t.timestamps
    end
  end
end
