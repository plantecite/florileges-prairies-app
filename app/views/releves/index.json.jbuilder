json.array!(@releves) do |releve|
  json.extract! releve, :id, :date, :name, :structure, :fonction, :time_start, :time_end, :hauteur, :milieux, :user_id, :site_id, :gestion_id
  json.url releve_url(releve, format: :json)
end
