class UserCategoriesController < ApplicationController
  def new
    @user_category = UserCategory.new
  end

  def create
    @user_category = UserCategory.new(user_category_params)
  end

  private

  def user_category_params
    params.require(:user_category).permit(:category_id, :user_id)
  end
end
