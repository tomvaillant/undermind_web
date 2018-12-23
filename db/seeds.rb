# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts 'Cleaning database...'
Content.destroy_all
ContentImage.destroy_all
Source.destroy_all
Category.destroy_all
ContentType.destroy_all
puts 'Creating new seed...'

puts 'Creating sources...'
source_a = Source.create!({ name: "Paul Graham" })
source_a.save

puts 'Creating content types...'
article = ContentType.create!({ name: "Articles" })
article.save
video = ContentType.create!({ name: "Videos" })
video.save
lecture = ContentType.create!({ name: "Lectures" })
lecture.save

puts 'Creating categories...'
entrepreneurship = Category.create!({ title: "Entrepreneurship" })
entrepreneurship.save
physics = Category.create!({ title: "Physics" })
physics.save

puts 'Creating content...'
paul_graham = Content.create!(
  title: "Kedrosky",
  url: "http://www.paulgraham.com/kedrosky.html",
  source: source_a,
  category: entrepreneurship,
  content_type: article
  )
paul_graham.save

csv_text = File.path(Rails.root.join('db', 'sample_1.csv'))
csv_options = { col_sep: ',', headers: :first_row }

CSV.foreach(csv_text, csv_options) do |row|
  c = Content.new
  c.url = row[0]
  c.title = row[5]
  medium = ContentType.where(name: "#{row[1]}").first
  category = Category.where(title: "#{row[3]}").first
  unless row[6].nil?
    image = ContentImage.create!({url: "#{row[6]}"})
    c.content_image = image
  end
  unless row[4].nil?
    c.range = row[4]
  end
  source = Source.where(name: "#{row[2]}").first
  if source.present?
    c.source = source
  else
    source_new = Source.create!({ name: "#{row[2]}"})
    source_new.save
    c.source = source_new
  end
  c.content_type = medium
  c.category = category
  c.save!
end








