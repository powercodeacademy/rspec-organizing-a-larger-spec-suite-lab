# frozen_string_literal: true

require_relative '../lib/deck'
require_relative '../lib/card'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  Dir[File.join(__dir__, 'support/**/*.rb')].sort.each { |f| require f }
end
