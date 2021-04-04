module Api
  module V1
    class CoachAppointmentsController < ApplicationController
      protect_from_forgery with: :null_session

      def update
        coach_appointment = CoachAppointment.find(coach_appointment_params[:id])
        if coach_appointment.update(coach_appointment_params)
          head :no_content
        else
          render json: { error: airline.errors.messages }, statue: 422
        end
      end

      private

      def coach_appointment_params
        params.require(:coach_appointment).permit(:id, :client)
      end

    end
  end
end
