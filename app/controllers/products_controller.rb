class ProductsController < ApplicationController
<<<<<<< HEAD
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

=======
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    # GET /users
>>>>>>> delivery_iannis
    def index
      @products = Product.all
      @rand_product = @products.sample(4)
    end
<<<<<<< HEAD
  
    def show
      post_params = params.permit(:id)
      @product = Product.find(post_params[:id])
    end
  
=======

    # GET /users/1
    def show
      @product = Product.find(params[:id])
      @rand_product = Product.all.sample(4)
      
    end

    # GET /users/1/edit
>>>>>>> delivery_iannis
    def edit
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        #@product = Product.find(params[:id])
      end
end
