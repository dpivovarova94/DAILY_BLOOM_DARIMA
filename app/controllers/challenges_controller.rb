class ChallengesController < ApplicationController

  def new
    # check if challenge of today already created. If so, directly link to show
    if !Challenge.where(created_at: Time.current.all_day, user: current_user).empty?
      @challenge = Challenge.where(created_at: Time.current.all_day, user: current_user).first

      redirect_to challenge_path(@challenge)
    # generate a new challenge if user opens app for first time today
    else
      @challenge = Challenge.new
      @user = current_user
      @keyword = Keyword.where(category: @user.categories).sample
      @challenge.keyword = @keyword
      # @keyword = @user.categories.keywords.sample
    end
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
    @challenge.save

    redirect_to challenge_path(@challenge)
  end

  def show
    @challenge = Challenge.find(params[:id])
    # @keyword = @challenge.keyword.name
  end

  private

  def challenge_params
    params.require(:challenge).permit(:keyword_id)
  end
end

# in simple form
# input type="hidden" name="keyword" value="@keyword"

# submit button => tap
