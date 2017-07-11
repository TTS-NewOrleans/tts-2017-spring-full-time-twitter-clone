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
    # find the like we want to DESTROY!
    # SMASH!!!
    @tweet.likes.where(user_id: current_user.id).destroy_all

    # flash a notice
    # redirect
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "Unliked." }
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
