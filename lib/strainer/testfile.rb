require 'tty-prompt'

prompt = TTY::Prompt.new
user_choice = prompt.select("What strain info would you like?", %w(Name Race Effect Flavor))

if user_choice == 'Name'
    puts "this would be the names list"
elsif user_choice == 'Race'
    puts "This would be the race list"
elsif user_choice == 'Effect'
    puts "this would be the effects list"
elsif user_choice == 'Flavor'
    puts "this would be the flavors list"
else puts "Invalid Selection"
end