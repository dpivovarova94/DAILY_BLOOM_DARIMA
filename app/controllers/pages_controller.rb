class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    @user = current_user
    @selected_categories = @user.categories

  end


end
