ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
include Warden::Test::Helpers

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  Warden.test_mode!
  include Capybara::DSL

  def upload_data(user, data)
    login_as(user, scope: :user)
    visit new_uploader_path
    fill_in 'epgp_parser_source', with: data
    click_button 'Create Epgp parser'
  end

  # Add more helper methods to be used by all tests here...
end
