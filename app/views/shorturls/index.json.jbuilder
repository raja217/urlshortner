json.array!(@shorturls) do |shorturl|
  json.extract! shorturl, :id, :originalurl, :shorturl, :clicks
  json.url shorturl_url(shorturl, format: :json)
end
