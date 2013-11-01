class GameController < ApplicationController
  def landing
  end

  def bootstrap
  end

  def testing
  end
  
  def templates
    render :landing, layout: "clean"
  end

  def static
    redirect_to "/assets/fonts/"+params[:path]+"."+params[:format]
  end
end
