class ChallengesController < ApplicationController

  def new
    # check if challenge of today already created. If so, directly link to show
    if Challenge.find_by(created_date: Date.today).where(user: current_user)
      @challenge = Challenge.find_by(created_date: Date.today).where(user: current_user)
      redirect_to challenge_path(@challenge)
    # generate a new challenge if user opens app for first time today
    else
      @challenge = Challenge.new

      @keyword = Keyword.where(category: current_user.categories).sample
    end
  end

  def create
    @challenge = Challenge.new(params in here)
    @challenge.save
    redirect_to challenge_path(@challenge)
  end

  def show
  end
end

in simple form
input type="hidden" name="keyword" value="@keyword"

submit button => tap
