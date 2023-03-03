class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscription_status
  def dashboard
  end

  private

  def check_subscription_status
    unless current_user.active_subscription
      redirect_to checkout_path(
        line_items: ['price_1MhShjKjFELnaoo9gcv3fpb2'],
        payment_mode: 'subscription'
      ), alert: 'You are not subscribed to this plan.'
    end
  end
end
