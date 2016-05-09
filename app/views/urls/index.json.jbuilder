json.array!(@urls) do |url|
  json.extract! url, :id, :originalurl, :shorturl, :clicks
  json.url url_url(url, format: :json)
end
