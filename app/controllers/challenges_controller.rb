class ChallengesController < ApplicationController

  def new
    # check if user logs in for first time of today
    # generate a new keyword
    # if user has already logged in once, link to show
  end

  def create
    @challenge = Challenge.new
    @challenge.save
    redirect_to new_challenge_post_path
  end

  def show
  end
end
