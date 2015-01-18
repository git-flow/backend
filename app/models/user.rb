class User < ActiveRecord::Base
  include Clearance::User

  def is_admin?
    is_admin
  end
end
