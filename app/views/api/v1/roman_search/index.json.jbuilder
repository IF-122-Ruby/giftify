json.array! @results do |result|
  case result.class.to_s.downcase
  when "user"
    json.merge! result.attributes.merge!({"link" => account_user_path(result.id)})
  when "gift"
    json.merge! result.attributes.merge!({"link" => account_gift_path(result.id)})
  end
  json.merge! result.attributes.merge!({"type" => "#{result.class.to_s.downcase}"})
end