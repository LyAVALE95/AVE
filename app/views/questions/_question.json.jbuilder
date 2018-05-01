json.extract! question, :id, :description,:quiz_id, :created_at, :updated_at
json.url question_url(question, format: :json)
