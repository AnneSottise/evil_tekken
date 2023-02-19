class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  process resize_to_fill: [350, 350]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
