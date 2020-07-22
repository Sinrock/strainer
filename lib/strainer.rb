require "strainer/version"

module Strainer
  class Error < StandardError; end
  class Test
    def say_hello
      puts "Hello World!"
    end
  end
end
