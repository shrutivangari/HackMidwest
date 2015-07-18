json.array!(@nutrients) do |nutrient|
  json.extract! nutrient, :id, :name, :description
  json.url nutrient_url(nutrient, format: :json)
end
