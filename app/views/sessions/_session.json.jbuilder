json.extract! session, :id, :name, :avaible, :price, :created_at, :updated_at
json.url session_url(session, format: :json)
