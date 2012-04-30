require 'open-uri'
require 'celluloid'

# An Echo service will just echo the value it's initialized with, with a
# configurable delay.
module ProjectTangoFoxtrot
  class Echo
    include Celluloid

    attr_reader :future_contents
    attr_reader :contents
    attr_reader :delay

    def initialize(future_contents, delay)
      @future_contents = future_contents
      @delay = delay
      @contents = ""
    end

    def load_contents
      sleep delay
      @contents = future_contents
    end

    def inspect
      "<Echo future_contents=#{future_contents}>"
    end
  end
end
