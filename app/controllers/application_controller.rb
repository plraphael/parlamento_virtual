class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private

  def current_player
    if session[:player_id]
      players = Player.where(id: session[:player_id]) 
      if players.count > 0
        @current_player = players.first 
      else
        @current_player = nil
        session[:player_id] = nil
      end
    end
    @current_player
  end
  helper_method :current_player
end
