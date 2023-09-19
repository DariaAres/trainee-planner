RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include Warden::Test::Helpers, type: :feature
  config.include Devise::Test::ControllerHelpers, type: :view
end
