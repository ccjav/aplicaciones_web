class TweetWorker
  include Sidekiq::Worker

  def perform(tweet_id)
    tweet = Tweet.find(tweet_id)
    user = TwitterUser.find(tweet.twitter_user_id)
    user.tweet(tweet.tweets)
  end
end