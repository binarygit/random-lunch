class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :bio
      t.string :email

      t.timestamps
    end
  end
end
