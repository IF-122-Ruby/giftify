class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :list_size_gift do
    process :resize_to_fit => [250, 150]
  end

  version :show_size_gift do
    process :resize_to_fit => [500, 300]
  end

  version :card_size_gift do
    process :resize_to_fit => [350, 350]
  end

  version :card_show_size_gift do
    process :resize_to_fit => [500, 400]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
