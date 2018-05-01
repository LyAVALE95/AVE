json.extract! session_detail, :id, :txt1, :txt2, :txt3,:session_id, :created_at, :updated_at
json.url session_detail_url(session_detail, format: :json)
