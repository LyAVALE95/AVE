json.extract! user_student, :id,:names,:lastnames,:name,:control_number,:carrer,:grade,:algorithm_level,:course_level,:score,:user_id,:school_id,:group_id,:user_teacher_id, :created_at, :updated_at
json.url user_student_url(user_student, format: :json)
