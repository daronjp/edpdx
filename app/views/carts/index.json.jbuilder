json.array!(@carts) do |cart|
  json.extract! cart, :id, :customer_id, :active, :purchase
  json.url cart_url(cart, format: :json)
end
