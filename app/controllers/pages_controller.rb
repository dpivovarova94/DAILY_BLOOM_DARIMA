class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    @user = current_user
    @selected_categories = @user.categories
    @posts = Post.joins(:challenge).where(challenges: { user_id: current_user.id })
    @friendship_requests = Friendship.where(friend_id: current_user.id)

  end

  def wrapped
    @user = current_user
    @last_posts = Post.joins(:challenge).where(challenges: { user_id: current_user.id }).last(4)
  end

end
