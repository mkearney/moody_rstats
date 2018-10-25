


##----------------------------------------------------------------------------##
##                                 TWITTER API                                ##
##----------------------------------------------------------------------------##

## To connect to Twitter's APIs, users need a **consumer key** and
##   **consumer secret**, which you can get by creating a Twitter app.
## View the https://rtweet.info for **`auth`** instructions on obtaining and
##   storing user access token: rtweet.info/articles/auth.html

## install and load rtweet
install.packages("rtweet")
## install httpuv
install.packages("httpuv")
library(rtweet)

## Friends/followers
## + Twitter's API documentation distinguishes between **friends** and **followers**.
##    - **Friend** refers to an account a given user follows
##    - **Follower** refers to an account following a given user
##
## `get_friends()`
##   - Get the list of accounts **followed by** @jack (co-founder and CEO of Twitter).
fds <- get_friends("jack")
fds

## Get friends of **multiple** users in a single call.
fds <- get_friends(c("hadleywickham", "NateSilver538", "Nate_Cohn"))
fds

## `get_followers()`
##   - Get the user IDs of accounts **following** a user with `get_followers()`.
kmw <- get_followers("kearneymw")
kmw

## Unlike friends (limited by Twitter to 5,000), there is **no** limit on the
## number of followers. To get user IDs of all 50+ million followers of
## @realDonaldTrump, you only need two things:
##   - 1. A stable **internet** connection
##   - 2. **Time** – approximately five and a half days
rdt <- get_followers("realdonaldtrump", n = 5e7, retryonratelimit = TRUE)

## `search_tweets()`
##   - Search for Twitter statuses containing a **keyword**, **phrase**,
##   or **multiple keywords**.

## + search for a keyword
rt <- search_tweets(q = "rstats")
rt

## + search for a phrase
rt <- search_tweets(q = "data science")
rt

## +search for multiple keywords
rt <- search_tweets(q = "rstats AND python")
rt

## By default, `search_tweets()` returns **100** tweets. To return more
## (rate limit is 18,000 per 15 minutes), set `n` to a higher number.
rt <- search_tweets(q = "rstats", n = 1000)
rt

## `search_tweets()`
## Use ` OR ` between search terms to find **any match**.
rt <- search_tweets("statistics OR statistical OR quantitative")

## Specify a **language** of the tweets and **exclude retweets**.
## search for tweets in english that are not retweets
rt <- search_tweets("rstats", lang = "en", include_rts = FALSE)

## Search by **geo-location**.
## search for tweets in english that are not retweets
## ### NEED GOOGLE API KEY
#rt <- search_tweets("lang:en", geocode = lookup_coords("Chicago, IL"))


## `search_tweets()`

## Search by **source** of a tweet (e.g., only tweets sent using `ifttt`
rt <- search_tweets("lang:en source:ifttt", n = 300)
table(rt$source)

## `get_timeline()`

## Provide a **user ID** or **screen name** and specify the **number** of
## tweets (max of 3,200).
cnn <- get_timeline("cnn", n = 3200)
ts_plot(cnn, "hours")

## `get_favorites()`
## Provide a **user ID** or **screen name** and specify the **number** of
## tweets (max of **3,000**).
kmw_favs <- get_favorites("kearneymw", n = 3000)
ts_plot(kmw_favs, "3 days")

## `lookup_tweets()`
status_ids <- c("947235015343202304", "947592785519173637",
  "948359545767841792", "832945737625387008")
twt <- lookup_tweets(status_ids)

## `lookup_users()`
## screen names
users <- c("hadleywickham", "NateSilver538", "Nate_Cohn")
usr <- lookup_users(users)


## `stream_tweets()`
## - "Random" **sample**
st <- stream_tweets(q = "", timeout = 30)

## - **Filter** by keyword
st <- stream_tweets(q = "realDonaldTrump,Mueller", timeout = 30)

## - **Locate** by bounding box
st <- stream_tweets(q = lookup_coords("London, GB"), timeout = 30)
