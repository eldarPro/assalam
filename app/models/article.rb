class Article < ApplicationRecord
  belongs_to :release
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :bookmarks
end
