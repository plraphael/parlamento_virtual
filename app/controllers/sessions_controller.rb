class SessionsController < ApplicationController
  def create
    player = Player.from_omniauth(env["omniauth.auth"])
    MissionGenerator.generate_first_missions(player)
    session[:player_id] = player.id
    render json: player.to_json
  end

  def destroy
    session[:player_id] = nil
    redirect_to "/game/testing"
  end
end