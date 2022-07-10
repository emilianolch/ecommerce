require 'mercadopago'

class PaymentsController < ApplicationController
  before_action :get_sdk, only: :create
  skip_before_action :verify_authenticity_token, only: :notification

  def create
    items = session[:cart].map { |id| Product.find(id) }.map &:to_preference_item

    preference_data = {
      payer: {
        name: 'Lalo',
        surname: 'Landa',
        email: 'test_user_63274575@testuser.com',
        phone: {
          area_code: '11',
          number: '42424242'
        },
        address: {
          zip_code: '5549',
          street_name: 'Falsa',
          number: 123
        }
      },
      payment_methods: {
        installments: 6,
        excluded_payment_methods: [
          { id: 'visa' }
        ] 
      },
      items:,
      back_urls: {
        success: payments_success_url,
        failure: payments_failure_url,
        pending: payments_pending_url
      },
      auto_return: 'approved',
      notification_url: payments_notification_url,
      external_reference: ENV['MP_USER_EMAIL']
    }

    preference = @sdk.preference.create(preference_data)[:response]
    redirect_to preference['init_point']
  end

  def success; end

  def pending; end

  def failure; end

  def notification
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def get_sdk
    @sdk = Mercadopago::SDK.new(ENV['MP_ACCESS_TOKEN'])
    @sdk.request_options.integrator_id = 'dev_24c65fb163bf11ea96500242ac130004'
  end
end
