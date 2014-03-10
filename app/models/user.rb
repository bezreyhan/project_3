class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    attr_accessor :password, :avatar
    

    has_many :user_interests
    has_many :interests, through: :user_interests
    accepts_nested_attributes_for :user_interests

    validates :first_name, presence: true, length: { maximum: 50 }
    validates :last_name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false } 
    
    validates :password, presence: true, length: { minimum: 4 }, :on => :create

    has_attached_file :avatar, :styles => {:thumb => '50x50#', :small => '100x100#', :medium => '125x125>'}, :default_url => "/images/peared.jpg"

    crop_attached_file :avatar


    validates_attachment_size :avatar, :less_than => 5.megabytes
    validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

    def full_name
        "#{first_name} #{last_name}"
    end

    geocoded_by :location
    after_validation :geocode

    def self.by_letter(letter)
        where("last_name LIKE ?", "#{letter}%").order(:last_name)
    end

    def self.search(search)
        if search
            find(:all, :conditions => ['first_name LIKE ? OR last_name LIKE ? OR interests LIKE ?', "%#{search.capitalize}%", "%#{search.capitalize}%", "%#{search.downcase}%"])
        else
            find(:all)
        end
    end

    def self.from_omniauth(data)
        if User.where(email: data["info"]["email"]).empty?
            user = User.new
            user.email = data["info"]["email"]
            user.first_name = data["info"]["first_name"]
            user.last_name = data["info"]["last_name"]
            user.password = SecureRandom.urlsafe_base64(n=6)
            user.save!
            return false
        else
            return true
        end
    end
    
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
