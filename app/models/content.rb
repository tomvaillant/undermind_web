class Content < ApplicationRecord
  validates :url, presence: true, uniqueness: true
  belongs_to :source
  belongs_to :category
  belongs_to :content_type
  has_one :content_image
  # validates :source, presence: true
  # validates :medium, presence: true
  # validates :category, presence: true

  include PgSearch
  pg_search_scope :search,
    against: [ :title ],
    associated_against: {
      source: [ :name ],
      category: [ :title ],
      content_type: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  # def self.search(query_item)
  #   query = "SELECT content.* FROM content"
  #   self.find_by_sql(query)
  # end
end
