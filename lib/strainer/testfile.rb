require 'open-uri'
require 'net/http'
require 'json'
require 'tty-prompt'


prompt = TTY::Prompt.new
user_choice = prompt.select("What strain info would you like?", %w(Name Race Effect Flavor))

class Flavors
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
class Effects
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

flavors = Flavors.new('http://strainapi.evanbusse.com/rvxnT8j/searchdata/flavors')
effects = Effects.new('http://strainapi.evanbusse.com/rvxnT8j/searchdata/effects')

if user_choice == 'Name'
    puts "this would be the names list"
elsif user_choice == 'Effect'
    puts effects.parse_json
elsif user_choice == 'Flavor'
    puts flavors.parse_json
else puts "Invalid Selection"
end