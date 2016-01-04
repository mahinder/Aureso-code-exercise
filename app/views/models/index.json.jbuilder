json.array!(@models) do |model|
  json.extract! model, :id, :name, :model_slug
  json.url model_url(model, format: :json)
end
