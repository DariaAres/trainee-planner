# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale, :configure_sign_up_params, only: [:create], if: :devise_controller?

  protected

  def configure_sign_up_params
    attributes = %i[first_name last_name email password password password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
