json.array!(@releves) do |relefe|
  json.extract! relefe, :id, :date, :name, :structure, :fonction, :time_start, :time_end, :hauteur, :milieux, :user_id, :site_id, :gestion_id
  json.url relefe_url(relefe, format: :json)
end
