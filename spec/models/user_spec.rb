require 'rails_helper'

RSpec.describe User, type: :model do
  require 'rails_helper'

RSpec.describe User, type: :model do


# clean de la database svp!
User.destroy_all


  before(:each) do
		@valid_user = User.create!(
			first_name: "first_name", 
			last_name: "last_name", 
			email: "mail@yopmail.com",
      password: "azeaze"
			)
	end

	context "validation" do

		it "is valide with valide attributes" do
			expect(@valid_user).to be_a(User)
			expect(@valid_user).to be_valid
		end

		describe "#first_name" do
      it "should not be valid whitout first_name" do
      	@valid_user.first_name = ""
        expect(@valid_user).not_to be_valid
      end
    end

    describe "#last_name" do
      it "should not be valid whitout last_name" do
      	@valid_user.last_name = ""
        expect(@valid_user).not_to be_valid
      end
    end


    describe "#email" do
      it "should not be valid without email" do
      	@valid_user.email = ""
        expect(@valid_user).not_to be_valid
      end
    end

    describe "#email" do
      it "should not be valid with wrong email" do
      	@valid_user.email = "yopmail.com"

				expect(@valid_user).not_to be_valid
      end
    end

    describe "#email" do
      it "should not be valid with wrong email" do
      	@valid_user.email = "yopmail@gamelcom"
				expect(@valid_user).not_to be_valid
      end
    end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
