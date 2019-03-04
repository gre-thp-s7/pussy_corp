class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
  
    # GET /users
    def index
      @products = Prodruct.all
    end
  
    # GET /users/1
    def show
    end
  
    # GET /users/1/edit
    def edit
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end
end
