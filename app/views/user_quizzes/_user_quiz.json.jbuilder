json.extract! user_quiz, :id, :score, :created_at, :updated_at
json.url user_quiz_url(user_quiz, format: :json)
