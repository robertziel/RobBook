json.array!(@friendships) do |friendship|
  json.extract! friendship, :id, :user_id, :friend_id, :confirmed, :create, :destroy
  json.url friendship_url(friendship, format: :json)
end
