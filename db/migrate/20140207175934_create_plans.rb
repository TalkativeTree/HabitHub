class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.references :user
      t.string :stripe_customer_token
      t.string :card_last4
      t.string :card_type
    end
  end
end
