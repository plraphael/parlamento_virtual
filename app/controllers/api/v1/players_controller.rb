class Api::V1::PlayersController < ApplicationController
  def index
    render json: [current_player].reject(&:nil?), root: "players"
  end

  def friends
    render json: Player.order_by(:points.desc, :name.asc), root: "friends"
  end

  def show
    render json: current_player
  end

  def checkin
    current_player.checkin
    render json: current_player
  end
end
