class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet

  def create
    # set_tweet
    # user_id (current user) / tweet_id (params)
    # make the like
    @tweet.likes.where(user_id: current_user.id).first_or_create

    # flash a notice
    # redirect somewhere
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "You really like me!" }
    end
  end

  def destroy
    # set_tweet
    # find the like we want gone
    # SMASH!!!
    # flash a notice
    # redirect
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
