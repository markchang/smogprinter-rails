This is the simplest Rails 3.0 + Omniauth 1.0 app I could come up with. After you authorize, it can tweet a message on your behalf.

Setup:

  * create a twitter application at http://dev.twitter.com
  * set callback to be http://127.0.0.1:3000 (assuming you are running it locally)
  * copy down the consumer key and consumer secret
  * export those values into your shell environment like
    * bash: export TWITTER_KEY = ... ; export TWITTER_SECRET = ..
  * ```bundle install```
  * ```rake db:migrate```
  * ```rails server```

