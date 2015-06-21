json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :salt, :email, :db, :roles, :reviews_count
  json.url user_url(user, format: :json)
end
