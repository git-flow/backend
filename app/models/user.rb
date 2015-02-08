class User < ActiveRecord::Base
  include Clearance::User

  has_many :templates

  def is_admin?
    is_admin
  end
end
