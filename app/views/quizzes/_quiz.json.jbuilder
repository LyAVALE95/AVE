json.extract! quiz, :id, :description, :approved, :avaible,:session_id,:user_teacher_id,:user_id, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
