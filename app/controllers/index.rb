get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  @user = TwitterUser.where(username: params[:username]).first_or_create
  if @user.tweets.empty?
    # User#fetch_tweets! should make an API call
    # and populate the tweets table
    #
    # Future requests should read from the tweets table 
    # instead of making an API call

    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)
  erb :index
end
