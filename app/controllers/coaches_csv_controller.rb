class CoachesCsvController < ApplicationController

  def csv
  end

  def import
    CoachesCsv.import(params[:file])
    redirect_to root_url, notice: 'Coaches imported.'
  end

end
