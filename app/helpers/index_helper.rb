module IndexHelper
  def has_bin?(image_paths_matched_to_name, name)
    image_paths_matched_to_name.any? { |ip| ip[:name] == name } 
  end

  def image_path(image_paths_matched_to_name, name)
    image_paths_matched_to_name.find { |ip| ip[:name] == name }&.dig(:path)
  end
end
