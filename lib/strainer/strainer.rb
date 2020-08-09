require_relative './environment.rb'

module Strainer
  class Error < StandardError; end
puts "Choosing ALL returns a LOT of data in a hash (pun intended), be ready for it!".red

prompt = TTY::Prompt.new 
first_choice = prompt.select("By what strain attribute would you like to search?".blue, %w(Name Race Effect Flavor ALL))

if first_choice == "ALL"
    then
    all_choice = AttributeParser.new("http://strainapi.evanbusse.com/rvxnT8j/strains/search/#{first_choice}")
    puts all_choice.parse_json
else

prompt_two = TTY::Prompt.new 
second_choice = prompt_two.ask("Which #{first_choice} would you like to search for? If nothing is returned, your search term isn't one thats accepted.".yellow)

encoded_second_choice = URI::encode("#{second_choice}") #changes spaces in the user's input into 8 bit, or %20 in the URL

selection = AttributeParser.new("http://strainapi.evanbusse.com/rvxnT8j/strains/search/#{first_choice}/#{encoded_second_choice}")

results = selection.parse_json

puts Hirb::Helpers::AutoTable.render(results, fields: %w|id name race desc flavor effect|).light_blue
end
end