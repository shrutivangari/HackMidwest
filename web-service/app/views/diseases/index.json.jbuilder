json.array!(@diseases) do |disease|
  json.extract! disease, :id, :name, :description
  json.url disease_url(disease, format: :json)
end
