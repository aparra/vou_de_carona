TWITTER_CONSUMER_KEY = "JsSFdTnRik24Y9Mrue4OcA"
TWITTER_CONSUMER_SECRET = "ZiEr9hvoethRry5988g7B032LUQm2gesg4BLdJ2X2PY"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET
end

Twitter.configure do |config|
  config.consumer_key = TWITTER_CONSUMER_KEY
  config.consumer_secret = TWITTER_CONSUMER_SECRET
end
