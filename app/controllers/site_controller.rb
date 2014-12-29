class SiteController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @invitation_request = WaitingListEntry.new
  end

  def request_invite
    @invitation_request = WaitingListEntry.create invite_params
    if @invitation_request
      # All good, invitation inserted
    else
      # Something went wrong, maybe the person is already on the list?
    end
  end

  def invite_params
    params.require(:invite).permit(:email)
  end
end
