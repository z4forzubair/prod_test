# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :shop

  enum service: %i[printing salon beds sofas lawn_jhoola tennis_table sports pets pet_food makeup
                   shaving_machine]

  validates :service, presence: true
end
