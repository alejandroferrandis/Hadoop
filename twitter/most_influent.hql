with data as (
SELECT retweeted_status.user.screen_name as retweeted_screen_name, 
           retweeted_status.text, 
           max(retweet_count) as retweets 
    FROM twitter.tweets 
    GROUP BY retweeted_status.user.screen_name, retweeted_status.text
)
SELECT retweeted_screen_name, 
    sum(retweets) AS total_retweets, 
    count(*) AS tweet_count 
FROM data
GROUP BY retweeted_screen_name 
ORDER BY total_retweets DESC 
LIMIT 10;