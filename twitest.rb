require 'faraday'
require 'uri'
require 'json'
require 'indico'

def getAccessToken()
  res = Faraday.new(:url => 'https://datamarket.accesscontrol.windows.net')
  .post( '/v2/OAuth2-13', {
    client_id: ENV['CLIENT_ID'],
    client_secret: ENV['CLIENT_SECRET'],
    scope: URI.decode('http://api.microsofttranslator.com/'),
    grant_type: 'client_credentials'
  })
  body = JSON.parse(res.body)
  body['access_token']
end

def translate(text)
  token = getAccessToken()
  res = Faraday.new(:url => 'http://api.microsofttranslator.com')
  .get( "/V2/Ajax.svc/Translate?to=en&text=#{URI.decode(text)}&oncomplete=translated") do |req|
    req.headers['Authorization'] = "Bearer #{token}"
  end
  eval(res.body)
end

def translated(text)
  text
end

indico_config = {api_key: ENV['INDICO_API_KEY'], cloud: ENV['YOUR_SUBDOMAIN']}
japanese_text = ARGV[0]
english_text = translate japanese_text
engagement = Indico.twitter_engagement(english_text, indico_config)
puts "#{english_text} (#{engagement})"
