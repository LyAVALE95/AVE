json.extract! user_teacher, :id,:names,:lastnames,:name,:control_number,:user_id, :created_at, :updated_at
json.url user_teacher_url(user_teacher, format: :json)
