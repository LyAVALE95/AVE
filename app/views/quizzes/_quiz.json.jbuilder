json.extract! quiz, :id, :description, :approved, :avaible, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
