json.array!(@etherpads) do |etherpad|
  json.extract! etherpad, :id
  json.url etherpad_url(etherpad, format: :json)
end
