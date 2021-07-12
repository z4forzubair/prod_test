class Shop < ApplicationRecord
  belongs_to :user, optional: true
  has_many :categories, dependent: :destroy
end
