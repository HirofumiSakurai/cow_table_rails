json.array!(@ai_logs) do |ai_log|
  json.extract! ai_log, :id, :cow_no, :date, :state, :owner_id
  json.url ai_log_url(ai_log, format: :json)
end
