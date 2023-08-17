# spec/support/test_login.rb
module TestLogin
  include Devise::Test::IntegrationHelpers

  # before(:context) do
  #   include Devise::Test::IntegrationHelpers
  # end

  def login(user)
    sign_in(user)
  end
end
