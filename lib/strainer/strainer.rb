require 'open-uri'
require 'net/http'
require 'json'
require 'tty-prompt'
require_relative './attributeparser.rb'

module Strainer
  class Error < StandardError; end

prompt = TTY::Prompt.new 
first_choice = prompt.select("By what strain attribute would you like to search?", %w(Name Race Effect Flavor ALL))

if first_choice == "ALL"
    then
    all_choice = AttributeParser.new("http://strainapi.evanbusse.com/rvxnT8j/strains/search/#{first_choice}")
    puts all_choice.parse_json
else

prompt_two = TTY::Prompt.new 
second_choice = prompt_two.ask("Which #{first_choice} would you like to search for?" )

selection = AttributeParser.new("http://strainapi.evanbusse.com/rvxnT8j/strains/search/#{first_choice}/#{second_choice}")

puts selection.parse_json
end
end