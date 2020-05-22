class PurchaseController < ApplicationController
  before_action :authenticate_user!

  def index
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = "sk_test_96379ca7e5e06277458aa64b"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = "sk_test_96379ca7e5e06277458aa64b"
    Payjp::Charge.create(
      :amount =>  Product.all.last[:price],
      :customer => card.customer_id,
      :currency => 'jpy',
    )
  set_product
  redirect_to done_purchase_index_path
  end

def  set_product
  @product = Product.all.last(params[:id])
  @product.update(buyer_id: current_user.id)
  end

end
