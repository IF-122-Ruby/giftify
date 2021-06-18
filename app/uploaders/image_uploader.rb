class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :small do
    process resize_to_fit: [250, 250]
  end

  version :preview do
    process resize_to_fit: [500, 500]
  end


  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
