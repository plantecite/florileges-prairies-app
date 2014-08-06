json.array!(@taxrefobservations) do |taxrefobservation|
  json.extract! taxrefobservation, :id, :q0, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :p, :espece_id, :releve_id
  json.url taxrefobservation_url(taxrefobservation, format: :json)
end
