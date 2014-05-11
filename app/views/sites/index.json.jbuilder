json.array!(@sites) do |site|
  json.extract! site, :id, :code, :name, :parc, :latitude, :longitude, :location
  json.url site_url(site, format: :json)
end
