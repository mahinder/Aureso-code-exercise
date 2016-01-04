json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :public_name, :type, :pricing_policy
  json.url organization_url(organization, format: :json)
end
