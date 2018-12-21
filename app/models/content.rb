class Content < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates :source, presence: true
  validates :type, presence: true
  validates :category, presence: true
end
