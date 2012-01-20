#Smog Printer

Open source copy of the Berg Cloud Printer.

First version will print the latest 20 mentions from Twitter.

Setup:

  * create a twitter application at http://dev.twitter.com
  * set callback to be http://127.0.0.1:3000 (assuming you are running it locally)
  * copy down the consumer key and consumer secret
  * export those values into your shell environment like
    * bash: export TWITTER_KEY = ... ; export TWITTER_SECRET = ..
  * ```bundle install```
  * ```rake db:migrate```
  * ```rails server```

