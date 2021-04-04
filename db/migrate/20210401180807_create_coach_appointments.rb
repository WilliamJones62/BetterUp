class CreateCoachAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :coach_appointments do |t|
      t.string :name
      t.string :timezone
      t.string :day_of_week
      t.string :appointment
      t.string :client

      t.timestamps
    end
  end
end
