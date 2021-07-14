json.results @results do |result|
  json.result do 
    json.type result.class.to_s
    case result.class.to_s
    when "User"
      json.url "users"
    when "Gift"
      json.url "rewards"
    end
    json.merge! result.attributes
  end
end
