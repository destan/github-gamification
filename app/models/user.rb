class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  include Authentication::ActiveRecordHelpers

  has_one :github_account
end
