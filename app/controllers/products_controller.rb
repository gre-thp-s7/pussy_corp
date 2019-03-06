class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    # GET /users
    def index
      @products = Product.all
      @rand_product = @products.sample(4)
    end

    def new

    end

    # GET /users/1
    def show
      @product = Product.find(params[:id])
      @rand_product = Product.all.sample(4)
      
    end

    # GET /users/1/edit
    def edit
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        #@product = Product.find(params[:id])
      end
end
