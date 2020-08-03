#This is a file that I used for testing my code before adding it to my main strainer.rb file so I wouldn't break the parts that I had working while I developed the rest of my code. 
require 'open-uri'
require 'net/http'
require 'json'
require 'tty-prompt'

class AttributeParser
    def initialize(url)
        @url = url
    end

    def get_response_body
        uri = URI.parse(@url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        JSON.parse(get_response_body)
    end
end