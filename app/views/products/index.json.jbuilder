json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :height, :width, :quantity, :description
  json.url product_url(product, format: :json)
end
