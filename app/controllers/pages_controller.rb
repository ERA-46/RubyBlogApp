class PagesController < ApplicationController
  def home
    return if current_user.payment_processor.nil?
    @portal_session = current_user.payment_processor.billing_portal
  end

  def about
  end
end
