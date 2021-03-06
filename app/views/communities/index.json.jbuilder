json.array!(@communities) do |community|
  json.extract! community, :description, :category, :location
  json.url community_url(community, format: :json)
end
