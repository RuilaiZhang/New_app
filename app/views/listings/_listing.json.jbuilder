json.extract! listing, :id, :user_id, :title, :condition, :price, :description, :sold, :created_at, :updated_at
json.url listing_url(listing, format: :json)
