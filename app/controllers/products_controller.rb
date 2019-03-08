class ProductsController < ApplicationController

    require 'open-uri'

    before_action :authenticate_admin, only: [:new, :create]

  def new
    # only cause we use a form_for
    @new_product = Product.new
  end

  def create

    @nb_products = Product.all.length
    @num_of_this_product = @nb_products + 1

    post_params = params.require(:product).permit(:description, :price, :picture)

    @new_product = Product.new
    @new_product.description = post_params[:description]

    @new_product.price = post_params[:price]

    @new_product.name = "pussy_picture_#{@num_of_this_product}"

    @new_product.picture.attach(post_params[:picture])

    if @new_product.save!
      flash[:success] = "produit créé !"
      redirect_to(product_path(@new_product.id))
    end
  end

    def index
      @products = Product.all
      @nb_products = Product.all.length
      @last_product1 = Product.find_by(id: @nb_products)
      @last_product2 = Product.find_by(id: @nb_products-1)
      @last_product3 = Product.find_by(id: @nb_products-2)
      @rand_product = @products.sample(4)
    end

    def show
      post_params = params.permit(:id)
#      @product = Product.find(post_params[:id])
      @product = Product.find(params[:id])
      @rand_product = Product.all.sample(4)
    end

    def all
      @products = Product.all
    end


    def edit
    end

    private

end











