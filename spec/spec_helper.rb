# frozen_string_literal: true

require 'rspec'
require_relative '../lib/deck'
require_relative '../lib/card'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  Dir[File.expand_path('support/**/*.rb', __dir__)].sort.each { |f| require f }
end
