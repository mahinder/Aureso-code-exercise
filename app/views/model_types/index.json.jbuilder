json.array!(@model_types) do |model_type|
  json.extract! model_type, :id, :name, :slug, :model_type_code, :base_price
  json.url model_type_url(model_type, format: :json)
end
