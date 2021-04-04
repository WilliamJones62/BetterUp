class RemoveTimezoneFromCoachAppointments < ActiveRecord::Migration[6.1]
  def change
    remove_column :coach_appointments, :timezone, :string
  end
end
