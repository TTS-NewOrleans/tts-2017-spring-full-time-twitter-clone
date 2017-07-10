class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:edit, :show, :update]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: "You just tweeted." }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    # Get the tweet we want to edit from the model and send it to the edit view
    # set_tweet before action gets the @tweet we want to edit
  end

  def update
    # before action gets the @tweet we want to update
    # update it with the new info (from params)
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "You changed that tweet!" }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    # set_tweet before action gets the @tweet we want to show
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end
end














