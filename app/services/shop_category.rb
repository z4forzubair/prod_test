# frozen_string_literal: true

class ShopCategory
  def initialize(shop = nil, services = nil); end

  def save_categories(shop, services)
    flag = true
    services.drop(1).each do |service|
      category = Category.new(service: service, shop_id: shop.id)
      flag = false unless category.save
    end
    flag
  end

  def delete_old_categories(shop)
    shop.categories.map(&:destroy)
  end

  def search_shops(query)
    shops = Shop.where('shop_name LIKE :search', search: "%#{query}%")
    shops = shops.to_a
    services = Category.services.keys
    services_list = []
    services.each_with_index { |service, index| services_list << index unless (service =~ /#{query}/i).nil? }
    categories = []
    services_list.each { |service| categories.concat Category.where(service: service) }
    categories.each { |cat| shops << cat.shop }
    shops.uniq(&:id)
  end
end
