class SubscriberController < ApplicationController
    before_action :set_subscriber, only: [:show, :update, :confirm]
  before_action :set_referrer, only: [:create, :confirm]

  def show
    render json: @subscriber, :only => ['email', 'user_key', 'share_key', 'sent_to_airtable', 'prize_sent'], :include => {:referrals => { :only => :email } }
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      if @referrer
        # send email here to confirm the referral eamils
      end

      render json: @subscriber.errors, status: :unprocessable_entity
    end
  end

  def confirm

  end

  def update

  end

  private

  def set_subscriber
    @subscriber = Subscriber.find_by_user_key(params[:id])
  end

  def set_referrer
    @referrer = Subscriber.find_by_share_key(params[:referrer_key])
  end

  def subcriber_params
    params
      .require(:subscriber)
      .permit(
        :first_name,
        :last_name,
        :email,
        :street_address_one,
        :street_address_two,
        :city,
        :state,
        :zip,
        :referrer_key
      )
  end
end
