class RelationshipsController < ApplicationController

  def create
    # user_id / friend_id
    # user_id (current user)
    # friend_id (params - from profile page)
    @relationship = current_user.relationships.build(friend_id: params[:friend_id])

    # save it
    if @relationship.save
      # TODO flash the friend's username in the notice
      flash[:notice] = "Followed successfully"
      redirect_to profile_path(params[:friend_id])
    else
      flash[:notice] = "Something went wrong"
      redirect_to profile_path(params[:friend_id])
    end
  end

  private

  def relationship_params
    params.require(:relationship).permit(:user_id, :friend_id)
  end
end
