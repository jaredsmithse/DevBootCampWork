# no original gist
require 'nokogiri'

class Post
  attr_accessor :title, :url, :points, :item_id, :comments

  def initialize(title, url, points, item_id)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comments = []
  end


  def add_comment(comment)
    @comments << comment
  end
end

class Comment
  attr_accessor :post_id, :usr_name, :text

  def initialize(post_id, usr_name, text)
    @post_id = post_id
    @usr_name = usr_name
    @text = text
  end

  def to_s
    puts "  Author: #{usr_name}"
    puts "  Comment: #{text}"
  end
end


### Driver Code ###

doc = Nokogiri::HTML(File.open('post.html'))
points = doc.search('.subtext > span:first-child')[0].inner_text[0..-8].to_i
id = doc.search('.subtext > a:nth-child(3)')[0]['href'][8..-1].to_i
post = Post.new(doc.title, doc.url, points, id)

comment_usr_names = doc.search('.comhead > a:first-child').map {|element| element.inner_text }
comment_texts = doc.search('.comment > font:first-child').map { |font| font.inner_text}

comment_usr_names.each_index do |index|
  post.add_comment(Comment.new(id, comment_usr_names[index], comment_texts[index]))
end

puts "The title of this post is #{post.title}"
puts "The id for this post is #{post.item_id}" 
puts "This post has #{post.points}"
puts "This post can be found at #{post.url}"
puts "The first comment:"
puts post.comments[0]