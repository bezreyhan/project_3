json.user do |json|
  json.extract! @user, :first_name, :last_name, :email, :location
  json.skills do |json|
    json.array!(@user.user_interests) do |ui|
      json.name Interest.find_by(id: ui.interest_id).name
      json.skill_level ui.skill_level
    end
  end
end