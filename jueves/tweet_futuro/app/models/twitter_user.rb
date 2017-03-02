class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def tweet(tweet_text)
    $client.access_token=self.oauth_token
    $client.access_token_secret=self.oauth_token_secret
    $client.update(tweet_text)
    last_tweet = $client.user_timeline(self.twitter_handles, count: 1)

    if last_tweet[0].full_text == tweet_text
      "Éxito"
    else
      "Error"
    end
  end

  def tweet_later(text, time, unit)
    tweet = Tweet.new(twitter_user_id: self.id, tweets: text)
    tweet.save!
    if unit == "hours"
      job_id = TweetWorker.perform_in(time.hours, tweet.id)
    elsif unit == "minutes"
      job_id = TweetWorker.perform_in(time.minutes, tweet.id)
    elsif unit == "seconds"
      job_id = TweetWorker.perform_in(time.seconds, tweet.id)
    end      
  end
end
