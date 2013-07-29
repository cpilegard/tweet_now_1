class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
    tweets = Twitter.user_timeline(self.username)
    tweets.each do |tweet|
      self.tweets.create(text: tweet.text)
    end
  end

  def tweets_stale?
    ((Time.now - self.tweets.last.created_at) / 60) > 15
  end
end
