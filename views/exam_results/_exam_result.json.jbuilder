json.extract! exam_result, :id, :student_id, :subject_id, :name, :score, :created_at, :updated_at
json.url exam_result_url(exam_result, format: :json)
