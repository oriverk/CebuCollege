json.extract! student, :id, :name, :email, :gender, :age, :opinion, :created_at, :updated_at
json.url student_url(student, format: :json)
