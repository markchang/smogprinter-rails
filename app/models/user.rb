class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.nickname = auth["info"]["nickname"]
      user.token = auth["credentials"]["token"]
      user.secret = auth["credentials"]["secret"]
      user.api_key = Digest::SHA1.hexdigest([Time.now, (1..10).map{rand.to_s}].flatten.join('--'))
    end
  end

  def secure_digest(*args)
    Digest::SHA1.hexdigest(args.flatten.join('--'))
  end

  def generate_api_key!
    self.update_attribute(:api_key, secure_digest(Time.now, (1..10).map{ rand.to_s }))
  end

  def disable_api!
    self.update_attributes(:api_key, "")
  end
  
  def api_is_enabled?
    !self.api_key.empty?
  end
  
  def tweet(message)
    Twitter.configure do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.oauth_token = self.token
      config.oauth_token_secret = self.secret
    end

    client = Twitter::Client.new
    client.update(message)
  end
  
  def get_mentions
    Twitter.configure do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.oauth_token = self.token
      config.oauth_token_secret = self.secret
    end

    tweets = []
    client = Twitter::Client.new
    client.mentions.map do |status|
      tweets << "#{status.user.screen_name}: #{status.text}"
    end
    
    return tweets
  end
end
