module IndexHelper
  def has_bin?(image_paths_matched_to_name, name)
    image_paths_matched_to_name.any? { |ip| ip[:name].casecmp(name).zero? }
  end

  def image_path(image_paths_matched_to_name, name)
    image_paths_matched_to_name.find { |ip| ip[:name].casecmp(name).zero? }&.dig(:path)
  end

  def register_bin_stats(register, image_paths_matched_to_name)
    has_bin_count = register.get_records.select { |r| has_bin?(image_paths_matched_to_name, r.item.value['name']) }.length
    records_count = register.get_records.count
    { has_bin_count: has_bin_count, register_count: records_count, percentage_complete: "#{(has_bin_count.to_f / records_count.to_f * 100).round}%" }
  end
end
