class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :create]

  def index
    @card = Card.new
    if current_user.id == @product.user_id || @product.order.present?
      redirect_to root_path
    end
  end
  
  def create
    @card = Card.new(card_params)
   
   binding.pry
   
    if @card.valid?
      pay_product
      @card.save
      return redirect_to root_path
    else
      render action: :index
    end
  end
    
  private

  def card_params
    params.require(:card).permit(
      :post_code, :prefecture_id, :city, :address, :build, :telephone
      ).merge(
      token: params[:token], product_id: params[:product_id], user_id: current_user.id
      )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
  
  
  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
   Payjp::Charge.create(
     amount: @product.price,
     card: card_params[:token],
     currency:'jpy'
   )
  end
end
  

