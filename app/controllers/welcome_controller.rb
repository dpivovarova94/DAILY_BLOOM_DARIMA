class WelcomeController < ApplicationController
  # No authentication required for the index action
  skip_before_action :authenticate_user!, only: [:index]

  # No navbar
  layout 'no_navbar'

  def index
  end
end
