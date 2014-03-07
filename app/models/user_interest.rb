class UserInterest < ActiveRecord::Base
  belongs_to :user
  belongs_to :interest

  # user user_interest should NOT be added if a 
  # user_interest with the same interest_id and user_id exists
  validates :interest_id, uniqueness: {scope: :user_id}
  
end
