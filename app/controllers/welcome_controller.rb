class WelcomeController < ApplicationController
  #no navbar
  layout 'no_navbar'

  def index
    # cookies[:seen_welcome_screen] = { value: 'true', expires: 1.year.from_now } unless cookies[:seen_welcome_screen]
    # @show_welcome_screen = !cookies[:seen_welcome_screen]
  end
end
