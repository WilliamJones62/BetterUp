class RemoveAppointmentFromCoachAppointments < ActiveRecord::Migration[6.1]
  def change
    remove_column :coach_appointments, :appointment, :string
  end
end
