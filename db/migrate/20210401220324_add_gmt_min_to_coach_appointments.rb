class AddGmtMinToCoachAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :coach_appointments, :gmt_min, :integer
  end
end
