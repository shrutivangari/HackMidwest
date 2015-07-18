json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :first_name, :last_name, :date_of_birth, :gender
  json.url user_url(user, format: :json)
end
