class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy] 

#il faut mettre un  before action avec current_user.is_admin == true

  def new
    # only cause i use a form_for in the view
    @new_product = Product.new
  end

  def create

    @nb_products = Product.all.length
    @num_of_this_product = @nb_products + 1

    post_params = params.require(:product).permit(:description, :price, :picture)

    @new_product = Product.new(post_params)

    @new_product.name = "pussy_picture_#{@num_of_this_product}"

    @new_product.picture.attach(post_params[:picture])

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
    end
  
    def show
      post_params = params.permit(:id)
      @product = Product.find(post_params[:id])
    end
  
    def edit
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end
end
