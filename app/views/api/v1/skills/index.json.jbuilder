json.skills @skills do |skill|
  json.id          skill.id
  json.name        skill.name
end

json.total_count @skills.count
