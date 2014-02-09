class UpdateController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :validate_user, only: [:create]
  before_action :authenticate_user!, only: [:index]

  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @updates = current_user.updates.order('created_at DESC').load.select { |p| p.created_at.day == @date.day }
  end

  def create
    @user.updates.create(content: params['Body'], twilio_body: params.except(:action, :controller))

    render nothing: true
  end

  def commands
    render :commands
  end

private
  def validate_user
    cellphone_number = PhonyRails.normalize_number(params['From'], default_country_code: 'US')
    @user = User.find_by_cellphone_number(cellphone_number)
  end
end

