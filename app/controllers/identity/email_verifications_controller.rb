class Identity::EmailVerificationsController < ApplicationController
  skip_before_action :require_authentication, only: :show

  before_action :set_user, only: :show

  def show
    @user.update! verified: true
    redirect_to root_path, notice: t("email_verifications.verified")
  end

  def create
    send_email_verification
    redirect_to root_path, notice: t("email_verifications.created")
  end

  private

  def set_user
    @user = User.find_by_token_for!(:email_verification, params[:sid])
  rescue
    redirect_to edit_identity_email_path, alert: t("email_verifications.invalid")
  end

  def send_email_verification
    UserMailer.with(user: Current.user).email_verification.deliver_later
  end
end
