class User < ActiveRecord::Base
    has_many :interest_users
    has_many :interests, through: :interest_users

  validates :username, presence: true
  validates :password, presence:true, length: {minimum: 6}
end
