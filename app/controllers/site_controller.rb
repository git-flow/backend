class SiteController < ApplicationController
  def index
    @invitation_request = WaitingListEntry.new
  end

  def request_invite
    @invitation_request = WaitingListEntry.create!(invite_params)

    # All good, invitation inserted
    redirect_to thank_you_path
  rescue ActiveRecord::RecordNotUnique
    # Something went wrong, maybe the person is already on the list?
    redirect_to root_path, flash: { email_error: t('hero.form.email_exists') }
  end

  private

  def invite_params
    params.require(:invite).permit(:email)
  end
end
