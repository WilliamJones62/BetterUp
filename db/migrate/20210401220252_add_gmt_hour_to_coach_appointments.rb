class AddGmtHourToCoachAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :coach_appointments, :gmt_hour, :integer
  end
end
