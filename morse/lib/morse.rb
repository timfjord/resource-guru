require 'thor'

require 'morse/char'
require 'morse/text'
require 'morse/cli'

module Morse
  InvalidChar = Class.new StandardError
end
