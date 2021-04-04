class CoachAppointmentsController < ApplicationController

  def main
    @coach_appointments = CoachAppointment.all
    @coaches = []
    @day_of_week = []
    @coach_appointments.each do |c|
      if !@coaches.include?(c.name)
        @coaches.push(c.name)
      end
    end
  end

end
