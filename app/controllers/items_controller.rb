class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:destroy, :edit, :update, :show]
  before_action :move_to_index, only: [:edit, :update]
  before_action :soldout, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to "/items/#{@item.id}"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :explain, :category_id, :condition_id, :delivery_price_id, :place_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in? && (@item.present? && current_user.id == @item.user_id)
      redirect_to root_path
    end
  end

  def soldout
    if @item.order.present?
      redirect_to root_path
    end
  end

end
