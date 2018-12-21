# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Source.destroy_all
Category.destroy_all
ContentType.destroy_all
Content.destroy_all
puts 'Creating new seed...'

puts 'Creating sources...'
source_a = Source.create!({ name: "Paul Graham" })
source_a.save

puts 'Creating content types...'
article = ContentType.create!({ name: "article" })
article.save
video = ContentType.create!({ name: "video" })
video.save
lecture = ContentType.create!({ name: "lecture" })
lecture.save

puts 'Creating categories...'
entrepreneurship = Category.create!({ title: "entrepreneurship" })
entrepreneurship.save

puts 'Creating content...'
paul_graham = Content.create!(
  title: "Kedrosky",
  url: "http://www.paulgraham.com/kedrosky.html",
  source: source_a,
  category: entrepreneurship,
  content_type: article
  )
paul_graham.save
