# Preview all emails at http://localhost:3000/rails/mailers/shop_mailer
class ShopMailerPreview < ActionMailer::Preview
  def mail_shopper
    shop = Shop.new(shop_name: "my shop", description: "description of my shop", user_id: 1)
    ShopMailer.with(shop: shop).mail_shopper
  end

end
