json.array!(@admin_real_laws) do |admin_real_law|
  json.extract! admin_real_law, :real_id, :name, :type, :number, :year, :proposition_date, :excerpt, :description, :regime, :appraisal, :state
  json.url admin_real_law_url(admin_real_law, format: :json)
end
