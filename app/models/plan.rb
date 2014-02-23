class Plan < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true

  attr_accessor :stripe_card_token

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: self.user.email, plan: 'ten-monthly-plan', card: stripe_card_token)
      self.stripe_customer_token = customer.id

      card = customer.cards.first
      self.card_last4 = card.last4
      self.card_type = card.type

      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end