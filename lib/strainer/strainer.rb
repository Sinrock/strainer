require_relative './environment.rb'
require_relative './attributeparser.rb'

module Strainer
  class Error < StandardError; end

puts "Choosing ALL returns a LOT of data, be ready for it!"

prompt = TTY::Prompt.new 
first_choice = prompt.select("By what strain attribute would you like to search?", %w(Name Race Effect Flavor ALL))

if first_choice == "ALL"
    then
    all_choice = AttributeParser.new("http://strainapi.evanbusse.com/rvxnT8j/strains/search/#{first_choice}")
    puts all_choice.parse_json
else

prompt_two = TTY::Prompt.new 
second_choice = prompt_two.ask("Which #{first_choice} would you like to search for? If nothing is returned, your search term isn't one thats accepted.")

encoded_second_choice = URI::encode("#{second_choice}") #changes spaces in the user's input into 8 bit, or %20 in the URL

selection = AttributeParser.new("http://strainapi.evanbusse.com/rvxnT8j/strains/search/#{first_choice}/#{encoded_second_choice}")

results = selection.parse_json

#puts results.map {|x| x.values}.uniq

puts results
end
end