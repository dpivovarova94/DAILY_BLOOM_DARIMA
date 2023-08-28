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
      render json: @search_results
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

  def create
    # friend = User.find(params[:friend_id])
    # @friendship = Friendshp.new()
  end

  def update

  end
end
