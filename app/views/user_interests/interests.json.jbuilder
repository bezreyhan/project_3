json.skills do |json|
  json.array!(@interests) do |interest|
    json.skill do |json| 
      json.name Interest.find_by(id: interest.interest_id).name
      json.skill_level interest.skill_level
    end
  end
end

