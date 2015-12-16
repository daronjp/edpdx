json.array!(@baskets) do |basket|
  json.extract! basket, :id, :product_id, :quantity
  json.url basket_url(basket, format: :json)
end
