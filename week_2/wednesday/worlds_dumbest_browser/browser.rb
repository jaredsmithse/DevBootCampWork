# original gist : https://gist.github.com/dbc-challenges/1b467db0f51df59a265e

require 'net/http'
require 'nokogiri'

require_relative 'util'

class Browser
  @@default = 'http://www.cnn.com/2013/02/06/travel/private-jets/index.html'
  def initialize
    @url = ""
  end

  def start
    puts "What URL would you like to use (type 'example' if you would like to see one)?"
    url = gets.chomp
    if url == 'example'
      page = Page.new(@@default)
    else
      page = Page.new(url)
    end

    page.fetch!

    page.user_friendly_report
  end
end

Browser.new.start