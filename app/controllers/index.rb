get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  @user = TwitterUser.where(username: params[:username]).first_or_create
  if @user.tweets_stale?
    @username = params[:username]
    erb :load_page
  else
    @tweets = @user.tweets.limit(10)
    erb :index
  end
end


post '/:username' do
  @user = TwitterUser.where(username: params[:username]).first_or_create
  if @user.tweets_stale?
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)

  tweets = []
  content_type :json
  @tweets.each do |tweet|
    puts tweet.text
    tweets << tweet.text
  end
  tweets.to_json
end 
