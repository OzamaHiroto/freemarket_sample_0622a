class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to root_path
    end
  end

  def show
    @item = Item.new
  end

  private
  def item_params
    params.permit(:category_id, :item_title, :description, :status, :price, :brand, :delivery_fee_payer, :prefecture, :shiping_day, :size, :delivery_method, :category)
    .merge(size: Size.find(params[:size]))
    .merge(status: Status.find(params[:status]))
    .merge(brand: Brand.find(params[:brand]))
    .merge(delivery_fee_payer: DeliveryFeePayer.find(params[:delivery_fee_payer]))
    .merge(prefecture: Prefecture.find(params[:prefecture]))
    .merge(shipping_day: ShippingDay.find(params[:shipping_day]))
    .merge(delivery_method: DeliveryMethod.find(params[:delivery_method]))
  end

end
