require 'twitest/version'
require 'faraday'
require 'uri'
require 'json'
require 'indico'

module Twitest
  def self.execute(text)
    english_text = translate text
    engagement = Indico.twitter_engagement(english_text, {api_key: ENV['INDICO_API_KEY']})
    puts "#{english_text} (#{engagement})"
  end

  def self.translate(text)
    token = get_access_token
    res = Faraday.new(:url => 'http://api.microsofttranslator.com')
            .get("/V2/Ajax.svc/Translate?to=en&text=#{URI.decode(text)}&oncomplete=translated") do |req|
              req.headers['Authorization'] = "Bearer #{token}"
            end
    eval(res.body)
  end

  private
    def self.get_access_token
      res = Faraday.new(:url => 'https://datamarket.accesscontrol.windows.net')
              .post('/v2/OAuth2-13', {
                client_id: ENV['CLIENT_ID'],
                client_secret: ENV['CLIENT_SECRET'],
                scope: URI.decode('http://api.microsofttranslator.com/'),
                grant_type: 'client_credentials'
              })
      body = JSON.parse(res.body)
      body['access_token']
    end

    def self.translated(text)
      text
    end
end
