class Favorite < ApplicationRecord
  
  validates :book_id, uniqueness: true
  
  belongs_to :user
  belongs_to :book
end
