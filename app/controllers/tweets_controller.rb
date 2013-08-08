class TweetsController < ApplicationController
  def showtweets
    @aggregated_tweets = []
    @aggregated_tweets << Twitter.user_timeline("kickstarter", :count => 10)
    @aggregated_tweets << Twitter.user_timeline("BestofKickstart", :count => 10)
    @aggregated_tweets << Twitter.user_timeline("BestKickstarter", :count => 10)
    @aggregated_tweets << Twitter.user_timeline("kickstartforum", :count => 10)
    @aggregated_tweets << Twitter.user_timeline("KickstartPlanet", :count => 10)
    @aggregated_tweets.flatten!.sort! { |a, b| b.created_at <=> a.created_at }
  end
end