class FriendshipsController < ApplicationController
  # layout false
  def search
    # @users = User.all
    if params[:search_query].present?
      sql_subquery = <<~SQL
        username ILIKE :search_query
        OR email ILIKE :search_query
      SQL
      @search_results = User.where(sql_subquery, search_query: "%#{params[:search_query]}%")
      # render json: @search_results
      # render partial: 'search_results', locals: { search_results: @search_results }, layout: false
    else
      # []
      @search_results = ""
      # render json: []
      # p "no results"
    end
    # render json: @search_results || []

    # respond_to do |format|
    #   format.html # Render the search.html.erb
    #   format.json { render json: @search_results } # Render JSON response
    # end
  end

  def new
    @friendship = Friendship.new
    # @friend = User.find(params[:friend_id])
  end

  def create
    # raise
    # @friend = User.find(params[:friend_id])
    # @friendship = Friendship.new(friendship_params)
    # @friendship.user = current_user
    # @friendship.friend = @friend
    # @friendship.status = "pending"

    # if @friendship.save
    #   redirect_to friendship_search_path, notice: "Friend request sent!"
    # else
    #   redirect_to friendship_search_path, notice: "Failed to send friend request."
    # end
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      # flash[:notice] = "Friend request sent to #{friend.username}."
      redirect_to friendship_search_path, notice: "Friend request sent!"
    else
      # flash[:alert] = "Something went wrong. Please try again."
      render :new, status: :unprocessable_entity
      # redirect_to friendship_search_path, notice: "Failed to send friend request."
    end
  end

  def edit

  end

  def update
    # @friendship = current_user.friendships.find(params[:id])

    # @friendship.status = params[:status]
    # if @friendship.save
    #   flash[:notice] = "Friend request #{params[:status]}ed."
    # else
    #   flash[:alert] = "Failed to #{params[:status]} friend request."
    # end
    # raise

    @frienship = Friendship.find(params[:id])
    if @frienship.update(friendship_params)
      redirect_to dashboard_path, notice: "Friend request #{friendship_params[:status]}"
    else
      render :new, status: :unprocessable_entity
      # raise
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:status)
  end
end
