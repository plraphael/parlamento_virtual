class Api::V1::PlayersController < ApplicationController
  def index
    render json: [current_player].reject(&:nil?), root: "players"
  end

  def show
    render json: current_player
  end
end
