#This requires a lot of other gems to work, but the end product is a nicer interface when making selections.
require 'open-uri'
require 'net/http'
require 'json'
require 'tty-prompt'

module Strainer
  class Error < StandardError; end

prompt = TTY::Prompt.new #Prompts the user to choose one of the 5 choices below
user_choice = prompt.select("By what strain attribute would you like to search?", %w(Name Race Effect Flavor ALL))

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

class Name
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

class Race
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

class All
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

thanks = "Thanks for using Strainer!"

if user_choice == 'Name'
    choice = gets.chomp
    name = Name.new("http://strainapi.evanbusse.com/rvxnT8j/strains/search/name/#{choice}")
    puts name.parse_json
    puts thanks

elsif user_choice == 'Effect' #I want to get this list pulled in from the API, not hardcoded in
    puts "Choices are: Relaxed, Dizzy, Hungry, Euphoric, Happy, Depression, Insomnia, Pain, Stress, Cramps, Creative, Energetic, Talkative, Lack of Appetite, Nausea, Dry Mouth, Headache, Uplifted, Tingly, Paranoid, Sleepy, Fatigue, Headaches, Dry Eyes, Focused, Eye PRessure, Anxious, Giggly, Aroused, Inflammation, Spasticity, Seizures, Muscle Spasms."
    effect_choice = gets.chomp
    effects = Effects.new("http://strainapi.evanbusse.com/rvxnT8j/strains/search/effect/#{effect_choice}")
    puts effects.parse_json
    puts thanks

elsif user_choice == 'Flavor' #I want to get this list pulled in from the API, not hardcoded in
  puts "Choices are: Earthy, Chemical, Pine, Spicy/Herbal, Pungent, Pepper, Flowery, Citrus, Orange, Sweet, Skunk, Grape, Minty, Woody, Cheese, Diesel, Tropical, Grapefruit, Nutty, Lemon, Berry, Blueberry, Ammonia, Apple, Rose, Butter, Honey, Tea, Lime, Lavender, Strawberry, Mint, Chetnut, Tree Fruit, Pear, Apricot, Peach, Blue Cheese, Menthol, Coffee, Tar, Mango, Pineapple, Sage, Vanilla, Plum Tobacco, Violet."
    flavor_choice = gets.chomp
    flavors = Flavors.new("http://strainapi.evanbusse.com/rvxnT8j/strains/search/flavor/#{flavor_choice}")
    puts flavors.parse_json
    puts thanks

elsif user_choice == 'Race' #I'm okay with this list being hardcoded however. :)
    puts "Choices are Indica, Sativa & Hybrid"
    race_choice = gets.chomp
    race = Race.new("http://strainapi.evanbusse.com/rvxnT8j/strains/search/race/#{race_choice}")
    puts race.parse_json
    puts thanks

elsif user_choice == 'ALL' #The developer of The Strain API DOES indeed recommend NOT running this  too much as its very resource intensive. 
    prompt = TTY::Prompt.new
    all_selection = prompt.select("This is a HUGE list, are you sure?", %w(Yes No))
if all_selection == 'Yes'
    put_it_all = All.new("http://strainapi.evanbusse.com/rvxnT8j/strains/search/all")
    puts put_it_all.parse_json
    puts thanks

else 
    puts "Good call! ;)"
    puts thanks

end
end
end