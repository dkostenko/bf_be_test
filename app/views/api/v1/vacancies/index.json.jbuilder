json.vacancies @vacancies do |vacancy|
  json.id           vacancy.id
  json.title        vacancy.title
  json.expired_at   vacancy.expired_at
  json.salary       vacancy.salary
  json.contacts     vacancy.contacts
  json.created_at   vacancy.created_at
  json.updated_at   vacancy.updated_at
end

json.total_count @vacancies.count
