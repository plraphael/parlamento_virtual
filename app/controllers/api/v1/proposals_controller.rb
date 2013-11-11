class Api::V1::ProposalsController < ApplicationController
  def index
    render json: Proposal.where(law_id: params[:law_id]).map{|law| law.scoped_with(current_player)}
  end

  def create
    proposal = Proposal.create(proposal_params.merge({player_id: current_player.id}))
    Point.points_for_proposal(current_player)
    render json: proposal
  end

  def update
    proposal = Proposal.find(params[:id])
    proposal = proposal.scoped_with(current_player).update_vote(post_params)
    
    render json: proposal.scoped_with(current_player)
  end

  private
  def post_params
    params.require(:proposal).permit(:favor)
  end

  def proposal_params
    params.require(:proposal).permit(:description, :player_id, :law_id)
  end
end
