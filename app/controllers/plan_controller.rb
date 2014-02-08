class PlanController < ApplicationController
  before_action :authenticate_user!

  def index
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user = current_user

    if @plan.save_with_payment
      redirect_to root_path, notice: "Thank you for subscribing!"
    else
      render :index
    end
  end

private
  def plan_params
    params.require(:plan).permit(:stripe_card_token)
  end
end

