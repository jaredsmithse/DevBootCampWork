# original gist : https://gist.github.com/dbc-challenges/1b467db0f51df59a265e

class Page
  attr_accessor :url, :page_content

  def initialize(url)
    @url = url
  end

  def fetch!
    @uri = URI.parse(@url)
    @response = Net::HTTP.get_response(@uri)
    @page_content = Nokogiri::HTML(@response.body)
  end

  def links
    links = []
    @page_content.search('a:first-child').each do |link|
      next if link['href'].nil?
      links << link['href'] if link['href'].include?("http")
    end
    links
  end

  def title
    @page_content.title
  end

  def user_friendly_report
    puts "Your page title is : #{title}"
    puts "Your links are : "
    links.each {|link| puts "  #{link}"}
    puts "The url for the page is : #{@url}"
  end
end