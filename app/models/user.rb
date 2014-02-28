class User < ActiveRecord::Base
    attr_accessor :password

    has_many :user_interests
    has_many :interests, through: :user_interests

    validates :username, presence: true
    validates :password, presence:true, length: {minimum: 6}
end
