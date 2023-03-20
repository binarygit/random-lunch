class CreateLunches < ActiveRecord::Migration[7.0]
  def change
    create_table :lunches do |t|
      t.date :lunch_date
      t.integer :resturant_id

      t.timestamps
    end
  end
end
