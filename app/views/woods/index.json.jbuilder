json.array!(@woods) do |wood|
  json.extract! wood, :id, :q1, :q2, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :total, :releve_id
  json.url wood_url(wood, format: :json)
end
