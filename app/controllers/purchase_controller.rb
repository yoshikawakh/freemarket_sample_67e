class PurchaseController < ApplicationController
  before_action :authenticate_user!
  def index
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      :amount => 30000,
      :customer => card.customer_id,
      :currency => 'jpy',
    )
  redirect_to done_purchase_index_path
  end
end
