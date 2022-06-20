# frozen_string_literal: true

require "waylon/core"
require_relative "jokes/version"

module Waylon
  module Jokes
    class Error < StandardError; end
    # Your code goes here...
  end
end

require_relative "skills/jokes"
