json.array!(@hq_users) do |hq_user|
  json.extract! hq_user, :id, :username, :password_hash, :password_salt, :is_admin
  json.url hq_user_url(hq_user, format: :json)
end
