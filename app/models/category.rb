class Category < ApplicationRecord
  belongs_to :shop

  validates :category, presence: true
end
