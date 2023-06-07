class UserCategoriesController < ApplicationController
  def new
    @user_category = UserCategory.new
  end

  def create
    @category_ids = params[:user_category][:category_id]

    @category_ids.each do |category|
      if category == ""
        next
      end

      @user_category = UserCategory.new(category_id: category, user: current_user)
      @user_category.save
    end

    redirect_to new_challenge_path
  end

  private

  def user_category_params
    params.require(:user_category).permit(:category_id)
  end
end
