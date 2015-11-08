json.employees @employees do |employee|
  json.id             employee.id
  json.name           employee.name
  json.email          employee.email
  json.phone          employee.phone
  json.status         employee.status
  json.salary         employee.salary
  json.created_at     employee.created_at
  json.updated_at     employee.updated_at
end

json.total_count @employees.count
