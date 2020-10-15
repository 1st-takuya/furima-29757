class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    if @item.order.present?
    redirect_to root_path(@item.user_id)
    end
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path(@item.user_id)
    else
      render :index
    end
  end

  private

  

  def order_params
    params.permit(:token, :postal_code, :shipping_id, :municipality, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  
end
