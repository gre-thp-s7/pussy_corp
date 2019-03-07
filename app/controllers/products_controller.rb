class ProductsController < ApplicationController

    before_action :set_product, only: [:show, :edit, :update, :destroy] 
require 'open-uri'
#il faut mettre un  before action avec current_user.is_admin == true

  def new
    # only cause i use a form_for in the view
    @new_product = Product.new
  end

  def create

    @nb_products = Product.all.length
    @num_of_this_product = @nb_products + 1

    post_params = params.require(:product).permit(:description, :price, :picture)
#binding.pry
    @new_product = Product.new
    @new_product.description = post_params[:description]

    @new_product.price = post_params[:price]

    @new_product.name = "pussy_picture_#{@num_of_this_product}"

    @new_product.picture.attach(post_params[:picture])
    #(io: post_params[:picture], filename: "#{@new_product.name}")


    if @new_product.save!
  puts "###############################################"
  puts "C\'est la fete, le produit a été crée"
  puts "###############################################"
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




    # GET /users/1

    def show
      post_params = params.permit(:id)
#      @product = Product.find(post_params[:id])
      @product = Product.find(params[:id])
      @rand_product = Product.all.sample(4)
    end


    def edit
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        #@product = Product.find(params[:id])
      end
end
