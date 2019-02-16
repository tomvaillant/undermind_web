class Content < ApplicationRecord
  self.paginates_per 15
  validates :url, presence: true
  belongs_to :source
  belongs_to :category
  belongs_to :content_type
  has_one :content_image

  include PgSearch
  pg_search_scope :search,
    against: [ :title ],
    associated_against: {
      source: [ :name ],
      category: [ :title ],
      content_type: [ :name ]
  }

end
