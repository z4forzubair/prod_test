# frozen_string_literal: true

module ShopsHelper
  def select_categories
    services = Category.services.keys
    services.map { |s| [s.gsub('_', ' ').capitalize, s] }
  end
end
