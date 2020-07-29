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
