CarrierWave.configure do |config|
  config.fog_provider = "fog/aws"
  config.fog_credentials = {
    :provider => "AWS",                        # required
    :aws_access_key_id => ENV["S3_KEY"],
    :aws_secret_access_key => ENV["S3_SECRET"],
    :region => ENV["S3_REGION"],
  }

  if Rails.env.production?
    config.root = Rails.root.join("tmp")
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end

  if Rails.env.development?
    config.root = Rails.root.join("tmp")
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end

  config.fog_directory = ENV["S3_BUCKET_NAME"]                   # required
  config.fog_attributes = {"Cache-Control" => "max-age=315576000"}
  config.storage = :fog
end
