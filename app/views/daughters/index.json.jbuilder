json.array!(@daughters) do |daughter|
  json.extract! daughter, :id, :owner_id
  json.url daughter_url(daughter, format: :json)
end
