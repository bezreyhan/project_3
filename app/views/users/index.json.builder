json.array!(@users) do |user|
  json.extract! user, :id, :latitude, :longitude, :address, :first_name, :last_name, :email, :username
  json.url user_url(user, format: :json)
end


end
