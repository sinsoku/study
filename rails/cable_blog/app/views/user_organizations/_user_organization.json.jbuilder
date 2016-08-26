json.extract! user_organization, :id, :user_id, :organization_id, :created_at, :updated_at
json.url user_organization_url(user_organization, format: :json)