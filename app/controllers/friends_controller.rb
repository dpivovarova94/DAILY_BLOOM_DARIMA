class FriendsController < ApplicationController
  def search
    if params[:search_query]
      @search_results = User.where("username ILIKE ?", "%#{params[:search_query]}%")
    else
      @search_results = []
    end
  end
end
