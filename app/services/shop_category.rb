# frozen_string_literal: true

class ShopCategory
  def initialize(shop = nil, services = nil); end

  def save_categories(shop, services)
    debugger
    flag = true
    services.drop(1).each do |service|
      category = Category.new(service: service, shop_id: shop.id)
      flag = false unless category.save
    end
    flag
  end
end
