class ShopPolicy < ApplicationPolicy
  def user_shopper?
    !@user.nil? && @user.shopper?
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

  def create?
    user_shopper?
  end

end