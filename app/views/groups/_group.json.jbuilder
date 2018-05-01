json.extract! group, :id,:name,:description,:schedule,:rooms,:semester,:career,:average, :created_at, :updated_at
json.url group_url(group, format: :json)
