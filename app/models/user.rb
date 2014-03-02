class User < ActiveRecord::Base
    attr_accessor :password
    before_save { self.email = email.downcase }

    has_many :user_interests
    has_many :interests, through: :user_interests

    validates :first_name, presence: true, length: { maximum: 50 }
    validates :last_name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
              uniqueness: true
    validates :password, presence:true, length: { minimum: 6 }

    scope :italy_loctions, -> { where(location: ['Venice, Italy', 'Rome, Italy', 'Florence, Italy'])}
end
