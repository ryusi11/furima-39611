class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  # before_action :set_item

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_location = OrderLocation.new
  end

  def create
    # binding.pry
    @order_location = OrderLocation.new(order_params)
    if @order_location.valid?
      pay_item
      @order_location.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render  :index, status: :unprocessable_entity
    end
  end

  private

  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    elsif current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  # def set_item
  #   @item = Item.find(params[:item_id])
  # end

  def order_params
    params.require(:order_location).permit(:code, :place_id, :city, :street, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

end
