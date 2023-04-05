class CreateLunchAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :lunch_appointments do |t|
      t.integer :lunch_id
      t.integer :lunch_participant_id

      t.timestamps
    end
  end
end
