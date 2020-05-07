class ProductsController < ApplicationController
  def new
  end

  def buy
    @address = Address.find_by(user_id: current_user.id)
    @product = Product.find(1)

    payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]

    customer = Payjp::Customer.retrieve(@creditcard.customer_id)
    @creditcard_information = customer.cards.retrieve(@creditcard.card_id)
    @card_brand = @creditcard_information.brand
    case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      end
    end
end
