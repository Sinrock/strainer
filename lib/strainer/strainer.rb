require "strainer/version"
require 'net/http'
require 'open-uri'
require 'json'

module Strainer
  class Error < StandardError; 
  end
  class Test
    def say_hello
      puts "Hello World!"
    end
  end
  working = Test.new
  puts working
end

class flavors
  def initialize(flavor)
    @flavor = flavor
  end

class GetRequester
    def initialize(url)
        @url = url
    end

    def get_response_body
        uri = URI.parse(@url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    #def parse_json
    #    JSON.parse(get_response_body)
    #end
end
# flavors url http://strainapi.evanbusse.com/rvxnT8j/searchdata/flavors
new_flavor = GetRequester.new(http://strainapi.evanbusse.com/rvxnT8j/searchdata/flavors)
puts new_flavor