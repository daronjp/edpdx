json.array!(@customers) do |customer|
  json.extract! customer, :id, :given_name, :family_name, :email, :address_1, :address_2, :city, :state, :zip
  json.url customer_url(customer, format: :json)
end
