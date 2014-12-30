class SiteController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @invitation_request = WaitingListEntry.new
  end

  def request_invite
    @invitation_request = WaitingListEntry.new invite_params
    if @invitation_request.save
      # All good, invitation inserted
      redirect_to thank_you_path, with
    else
      # Something went wrong, maybe the person is already on the list?
      redirect_to invitation_request_error, flash: ''
    end
  end

  def thank_you
  end

  private
    def invite_params
      params.require(:invite).permit(:email)
    end
end
