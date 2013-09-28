json.array!(@communities) do |community|
  json.extract! community, :description
  json.url community_url(community, format: :json)
end
