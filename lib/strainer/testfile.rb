#This is a file that I used for testing my code before adding it to my main strainer.rb file so I wouldn't break the parts that I had working while I developed the rest of my code. 


require 'optparse'
@options = {}
OptionParser.new do |opts|
  opts.on("-n", "--name", "Search by Name") do
    @options[:verbose] = true
  end
  opts.on("-r", "--race", "Search by Race") do
    @options[:syntax_highlighting] = true
  end
  opts.on("-e", "--effect", "Search by Effect") do
    @options[:syntax_highlighting] = true
  end
  opts.on("-f", "--flavor", "Search by Flavor") do
    @options[:syntax_highlighting] = true
  end
end.parse!
p @options