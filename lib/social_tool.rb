module SocialTool
  def self.twitter_search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY")
      config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET")
      config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("TWITTER_ACCESS_SECRET")
    end

    client.search("(#visualize OR #splunk OR #gis OR #esri -rt -emoji", result_type: 'mixed', lang: 'en').take(6).collect do |tweet|
      "<h6>#{tweet.user.screen_name}:</h6>
       <h6>#{tweet.created_at}</h6>
       <p class='brake-line-s'></p>
       <h5>#{tweet.text}</h5>
      "
    end
  end
end
