class ShopMailer < ApplicationMailer
  def mail_shopper
    @shop = params[:shop]
    # @shop.user.email
    mail(to: 'muhammad.zubair0995@gmail.com', subject: 'Customer wants to contact')
  end
end
