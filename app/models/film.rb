class Film < ApplicationRecord
  enum status: { draft: 0, published: 2, }
  has_one_attached :poster
  belongs_to :director
  belongs_to :genre
end
