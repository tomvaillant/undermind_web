# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts 'destroying videos...'
# vids = ContentType.find(2)
# to_destroy = Content.where(content_type: vids)
# to_destroy.destroy_all

require 'csv'

puts 'Creating videos...'

csv_text = File.path(Rails.root.join('db', 'articles.csv'))
csv_options = { col_sep: ',', headers: :first_row }

CSV.foreach(csv_text, csv_options) do |row|
  c = Content.new
  c.url = row[0]
  if row[4].present?
    c.title = row[4]
  else
    temp_title = c.url.split(/([^\/]+$)/).last
    c.title = temp_title.gsub(/(_)|(-)/, " ")
  end
  medium = ContentType.where(name: "#{row[1]}").first
  c.content_type = medium
  category = Category.where(title: "#{row[3]}").first
  if category.present?
    c.category = category
  else
    category_new = Category.create!({ title: "#{row[3]}"})
    category_new.save!
    c.category = category_new
  end
  source = Source.where(name: "#{row[2]}").first
  if source.present?
    c.source = source
  else
    source_new = Source.create!({ name: "#{row[2]}"})
    source_new.save!
    c.source = source_new
  end
  c.save!
  unless row[5].nil?
    image = ContentImage.new({ url: "#{row[5]}" })
    image.content = c
    image.save!
  end
end








