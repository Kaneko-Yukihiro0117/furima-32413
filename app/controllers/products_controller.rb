class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name, :introduction, :price, :category_id, :delivery_fee_id, :delivery_date_id, :prefecture_id, :item_condition_id,
      :image
    ).merge(user_id: current_user.id)
  end
end
