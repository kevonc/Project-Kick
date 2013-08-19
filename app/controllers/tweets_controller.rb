class TweetsController < ApplicationController
  def showtweets
    @official_tweets = []
    @official_tweets << Twitter.user_timeline("kickstarter", :count => 10)
    @official_tweets << Twitter.user_timeline("BestofKickstart", :count => 10)
    @official_tweets << Twitter.user_timeline("BestKickstarter", :count => 10)
    @official_tweets << Twitter.user_timeline("kickstartforum", :count => 10)
    @official_tweets << Twitter.user_timeline("KickstartPlanet", :count => 10)
    @official_tweets.flatten!.sort! { |a, b| b.created_at <=> a.created_at }

    @people_tweets = Twitter.search("#kickstarter -rt", :lang => "en").attrs[:statuses]
    expires_in 10.minutes, public: true
  end
end