class ChallengesController < ApplicationController

  def new
      @user = current_user
      # Check if challenge of today already exists for the current user
      existing_challenge = Challenge.find_by(user: @user, created_at: Time.current.all_day)

      if existing_challenge
        redirect_to challenge_path(existing_challenge)
      else
        @challenge = Challenge.new
        @keyword = Keyword.where(category: @user.categories).sample
        @challenge.keyword = @keyword
      end
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
    @challenge.save
    redirect_to challenge_path(@challenge)
  end

  def success
  end

  def show
    existing_post = Post.joins(:challenge).find_by(challenges: { user_id: current_user.id, created_at: Time.current.all_day})

    if existing_post
      redirect_to challenge_success_path
    else
      @challenge = Challenge.find(params[:id])
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:keyword_id)
  end
end
