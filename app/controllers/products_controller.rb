class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update]

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

  def show
  end

  def edit
    redirect_to root_path unless user_signed_in? && current_user.id == @product.user_id
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end
end

  private

def product_params
  params.require(:product).permit(
    :name, :introduction, :price, :category_id, :delivery_fee_id, :delivery_date_id, :prefecture_id, :item_condition_id,
    :image
  ).merge(user_id: current_user.id)
end

def set_product
  @product = Product.find(params[:id])
end
