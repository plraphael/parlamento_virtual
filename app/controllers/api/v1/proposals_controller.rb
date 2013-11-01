class Api::V1::ProposalsController < ApplicationController
  def index
    render json: Proposal.where(law_id: params[:law_id])
  end

  def create
    proposal = Proposal.create(proposal_params.merge({player_id: current_player.id}))

    event = "messages.law"
    $redis.publish(event,{message: {message: "" , event: event}}.to_json)

    render json: proposal
  end

  private
  def proposal_params
    params.require(:proposal).permit(:description, :player_id, :law_id)
  end
end