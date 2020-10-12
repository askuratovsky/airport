class MainController < ApplicationController
  def board
    @airplanes = Airplane.includes(:state_logs).order(:id).all
  end

  def airplane
    plane = Airplane.includes(:state_logs).find(params[:id])
    render partial: 'airplane', locals: {plane: plane}
  end

  def launch
    plane = Airplane.includes(:state_logs).find(params[:id])
    plane.depart!
    AirplaneLauncher.launch(plane.id)
    plane.reload
    render partial: 'airplane', locals: {plane: plane}
  end
end
