class UserInterest < ActiveRecord::Base
  belongs_to :user
  belongs_to :interest

  validates :interest_id, uniqueness: {scope: :user_id}

end
