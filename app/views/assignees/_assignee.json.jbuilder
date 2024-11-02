json.extract! assignee, :id, :name, :email, :todos, :created_at, :updated_at
json.url assignee_url(assignee, format: :json)
