class UserCategoriesController < ApplicationController
  def new
    @user_category = UserCategory.new
    @categories = Category.all
  end

  def create
    @category_ids = params[:user][:category_ids]

    @category_ids.each do |category|
      if category == ""
        next
      end

      @user_category = UserCategory.new(category_id: category, user: current_user)
      @user_category.save
    end

    redirect_to new_challenge_path
  end

  def edit
    @user = current_user
    @categories = Category.all
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to dashboard_path, notice: 'Challenge was successfully created.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(category_ids: [])
  end
end
