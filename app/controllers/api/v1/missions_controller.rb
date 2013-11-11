class Api::V1::MissionsController < ApplicationController
  def index
    render json: current_player.missions if current_player != nil
  end
end
