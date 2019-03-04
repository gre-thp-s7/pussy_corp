require 'rails_helper'

RSpec.describe Product, type: :model do

# clean de la database de test svp!
Product.destroy_all


  before(:each) do
		@valid_product = Product.create!(
			name: "name", 
			description: "ohh, this is a lovely cats",
		  price: 27,
      image_url: "file/adress/img.url"
			)		
	end


	context "validation" do

		it "is valide with valide attributes" do
			expect(@valid_product).to be_a(Product)
			expect(@valid_product).to be_valid
		end


				describe "#name" do
      it "should not be valid whitout name" do
      	@valid_product.name = ""
        expect(@valid_product).not_to be_valid
      end
    end

				describe "#description" do
      it "should not be valid whitout description" do
      	@valid_product.description = ""
        expect(@valid_product).not_to be_valid
      end
    end

				describe "#price" do
      it "should not be valid whitout price" do
      	@valid_product.price = ""
        expect(@valid_product).not_to be_valid
      end
    end

				describe "#image" do
      it "should not be valid whitout image_url" do
      	@valid_product.image_url = ""
        expect(@valid_product).not_to be_valid
      end
    end
  end

	context "attribute already taken" do


	  before(:each) do
	  	#create a product2  with the same 
			@valid_product2 = Product.create!(
				name: "also_a_name", 
				description: "ohh, this is a lovely cats",
			  price: 27,
	      image_url: "also/file/adress/img.url"
				)
		end

				describe "#name" do
      it "should not be valid with the same name" do
      	@valid_product2.name = "name"     	
        expect(@valid_product2).not_to be_valid
      end
    end

				describe "#image_url" do
      it "should not be valid with the same image_url" do
      	@valid_product2.image_url = "file/adress/img.url"     	
        expect(@valid_product2).not_to be_valid
      end
    end


  end

end 
