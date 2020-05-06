class ProductsController < ApplicationController
  def new
  end

  def buy
    @user = current_user
    # @creditcard = Creditcard.where(uer_id: current_user.id).first
    @address = Address.where(user_id: current_user.id).first
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
