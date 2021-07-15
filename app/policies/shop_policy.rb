class ShopPolicy < ApplicationPolicy
  def user_shopper?
    !@user.nil? && @user.shopper?
  end

  def check_user_shop?
    Shop.where(user_id: @user.id).include? @record
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    user_shopper?
  end

  def edit?
    user_shopper? && check_user_shop?
  end

  def create?
    user_shopper?
  end

  def update?
    user_shopper? && check_user_shop?
  end

  def destroy?
    user_shopper? && check_user_shop?
  end
end