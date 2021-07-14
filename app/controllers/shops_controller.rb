# frozen_string_literal: true

# require_dependency 'app/services/shop_saver.rb'

class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show edit update destroy]

  # GET /shops or /shops.json
  def index
    @shops = Shop.all
  end

  # GET /shops/1 or /shops/1.json
  def show; end

  # GET /shops/new
  def new
    @shop = Shop.new
    authorize @shop
  end

  # GET /shops/1/edit
  def edit; end

  # POST /shops or /shops.json
  def create
    params = shop_params
    @shop = Shop.new(shop_name: params[:shop_name], description: params[:description])
    authorize @shop
    @shop.user_id = current_user.id
    respond_to do |format|
      if @shop.save
        flag = ShopCategory.new.save_categories(@shop, params[:category])
        notice = if flag
                   'Shop was successfully saved.'
                 else
                   'Shop was successfully saved, but some services could not be added'
                 end
        format.html { redirect_to @shop, notice: notice }
        format.json { render :show, status: :created, location: @shop }
      else
        # @shop.errors.add(:category, 'not saved')
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1 or /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1 or /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shop
    @shop = Shop.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def shop_params
    params.fetch(:shop, {})
    params.require(:shop).permit(:shop_name, :description, category: [])
  end
end
