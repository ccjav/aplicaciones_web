post '/fetch' do
  redirect "/user/#{params[:handle]}"
end

get '/user/:handle' do
  if TwitterUser.where(:twitter_handles => params[:handle]).present?
    user = TwitterUser.where(:twitter_handles => params[:handle])
    user = user[0]
    @saved_tweets = user.tweets.map { |tweet| tweet.tweets }
    @unsaved_tweets = ($client.user_timeline("#{params[:handle]}", count: 10)).map { |tweet| tweet.full_text }
    @latest_tweets = (@unsaved_tweets - @saved_tweets) + @saved_tweets
  else
    user = TwitterUser.new(twitter_handles: params[:handle])
    user.save!
    tweets = $client.user_timeline("#{params[:handle]}", count: 10)
    tweets.each do |tweet|
      new_tweet = Tweet.new(twitter_user_id: user.id, tweets: tweet.full_text)
      new_tweet.save!
    end
    @latest_tweets = user.tweets.map { |tweet| tweet.tweets }
  end

  erb :handle
end