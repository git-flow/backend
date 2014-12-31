class SiteController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @invitation_request = WaitingListEntry.new
  end

  def request_invite
    @invitation_request = WaitingListEntry.new(invite_params)

    # An invite may fail saving because the email given might already exist
    if @invitation_request.save
      # All good, invitation inserted
      redirect_to thank_you_path
    else
      # Something went wrong, maybe the person is already on the list?
      redirect_to invitation_request_error
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:email)
  end
end
