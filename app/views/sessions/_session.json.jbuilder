json.extract! session, :id, :name, :avaible, :price,:user_teacher_id,:user_id, :created_at, :updated_at
json.url session_url(session, format: :json)
