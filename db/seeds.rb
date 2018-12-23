# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts 'Cleaning database...'
ContentImage.destroy_all
Content.destroy_all
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
podcasts = ContentType.create!({ name: "Podcasts" })
podcasts.save

puts 'Creating categories...'
entrepreneurship = Category.create!({ title: "Entrepreneurship" })
entrepreneurship.save
physics = Category.create!({ title: "Physics" })
physics.save
technology = Category.create!({ title: "Technology" })
technology.save
behavioural_science = Category.create!({ title: "Behavioural Science" })
behavioural_science.save
engineering = Category.create!({ title: "Engineering" })
engineering.save
history = Category.create!({ title: "History" })
history.save
computer_science = Category.create!({ title: "Computer Science" })
computer_science.save
astronomy = Category.create!({ title: "Astronomy" })
astronomy.save
biology = Category.create!({ title: "Biology" })
biology.save
mathematics = Category.create!({ title: "Mathematics" })
mathematics.save
environmental = Category.create!({ title: "Environmental" })
environmental.save

puts 'Creating lectures...'

csv_text = File.path(Rails.root.join('db', 'lectures.csv'))
csv_options = { col_sep: ',', headers: :first_row }

CSV.foreach(csv_text, csv_options) do |row|
  c = Content.new
  c.url = row[0]
  c.title = row[5]
  medium = ContentType.where(name: "#{row[1]}").first
  category = Category.where(title: "#{row[3]}").first
  if category.present?
    c.category = category
  else
    category_new = Category.create!({ title: "#{row[3]}"})
    category_new.save!
    c.category = category_new
  end
  unless row[4].nil?
    c.range = row[4]
  end
  source = Source.where(name: "#{row[2]}").first
  if source.present?
    c.source = source
  else
    source_new = Source.create!({ name: "#{row[2]}"})
    source_new.save!
    c.source = source_new
  end
  c.content_type = medium
  c.save!
  unless row[6].nil?
    image = ContentImage.new({ url: "#{row[6]}" })
    image.content = c
    image.save!
  end
end








