class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

      if @order.save
      # STRIPE HERE
      else
        flash[:error] = "Il y a eu un problème lors de la création de la commande, contactez notre service client"
      end
  
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:order_command, :product_list, :cart_id)
  end
end