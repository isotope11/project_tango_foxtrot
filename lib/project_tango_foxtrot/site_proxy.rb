require 'open-uri'
require 'celluloid'

# A SiteProxy will take an URL when it's initialized, and when run it will
# net/http out to grab the site on the other end of the url and set its
# @contents
# instance variable to the contents of the page.
module ProjectTangoFoxtrot
  class SiteProxy
    include Celluloid

    attr_reader :contents
    attr_reader :url

    def initialize(url)
      @url = url
      @contents = ""
    end

    def load_contents
      @contents = open(@url){|f| f.read }
    end

    def inspect
      "<SiteProxy url=#{url}>"
    end
  end
end
