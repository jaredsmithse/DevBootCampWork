50.times do |i|
  categories = ["business", "Business", "computer world", "computer-world", "HEALTH", "Sports", "sport", "programming"]
  tags = %w{ cloud random random-tags cloud widget medicine art music love hate tech computer ruby rails jquery}
  Article.create :title => Faker::Lorem.words(3).join(' '),
                 :description => Faker::Lorem.paragraph,
                 :category => categories.sample,
                 :tags => tags.sample(rand(4)).join(', ')
end
