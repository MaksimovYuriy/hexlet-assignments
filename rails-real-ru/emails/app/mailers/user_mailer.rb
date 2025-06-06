# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation
    # BEGIN
    @user_email = params[:user_email]
    @user_token = params[:user_token]
    mail(to: @user_email, subject: I18n.t('en.user_mailer.account_activation.subject'))
    # END
  end
end
