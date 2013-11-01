class Api::V1::LawsController < ApplicationController
  def index
    render json: Law.all.map{|law| law.scoped_with(current_player)}
  end
  def show
    render json: Law.find(params[:id]).scoped_with(current_player)
  end

  def update
    law = Law.find(params[:id])
    law = law.scoped_with(current_player).update_vote(post_params)

    event = "messages.law"
    $redis.publish(event,{message: {message: "" , event: event}}.to_json)

    render json: law.scoped_with(current_player)
  end

  private
  def post_params
    params.require(:law).permit(:defined,:favor)
  end
end
