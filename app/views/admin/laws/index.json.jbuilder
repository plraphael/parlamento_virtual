json.array!(@admin_laws) do |admin_law|
  json.extract! admin_law, :title, :type, :excerpt, :description, :state, :real_law_id
  json.url admin_law_url(admin_law, format: :json)
end
