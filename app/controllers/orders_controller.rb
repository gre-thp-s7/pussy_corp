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

    @order.product_list.each do |product|
    @total = @total + product.price
    end

# Amount in cents
@amount = @total*100

customer = Stripe::Customer.create(
  {
  email: params[:stripeEmail],
  source: params[:stripeToken],
  })

charge = Stripe::Charge.create(
  {
  customer: customer.id,
  amount: @amount.to_i,
  description: "Paiement Stripe",
  currency: 'eur',
  })


      if @order.save
        flash[:success] = "La commande est validée"
        redirect_to root_path
      else
        flash[:error] = "Il y a eu un problème lors de la création de la commande, contactez notre service client"
      end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to order_path(@cart)
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