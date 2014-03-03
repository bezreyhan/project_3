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

    def authenticated? pwd
        self.hashed_password ==
        BCrypt::Engine.hash_secret(pwd, self.salt)
    end

    before_save :hash_the_password
  
    private 

    def hash_the_password
        unless self.password == nil
          self.salt = BCrypt::Engine.generate_salt
          self.hashed_password = BCrypt::Engine.hash_secret self.password, self.salt
          self.password = nil
        end 
    end
end
