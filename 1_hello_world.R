# hello world example

# install libraries
# install.packages("googleAuthR")
# install.packages("googleAnalyticsR")

# load libraries
library("googleAuthR")
library("googleAnalyticsR")

# optional - add your own Google Developers Console key
#options(googleAuthR.client_id = "uxxxxxxx2fd4kesu6.apps.googleusercontent.com")
#options(googleAuthR.client_secret = "3JhLa_GxxxxxCQYLe31c64")
#options(googleAuthR.scopes.selected = "https://www.googleapis.com/auth/analytics")

# authorize connection with Google Analytics servers
ga_auth()

## get your accounts
account_list <- google_analytics_account_list()

## pick a profile with data to query
#ga_id <- account_list[275,'viewId']

# or give it explicite using tool http://michalbrys.github.io/ga-tools/table-id.html in format 99999999
ga_id <- 00000000

# get data from Goolgle Analytics account
gadata <- google_analytics(id = ga_id, 
                           start="2016-01-01", end="2016-06-30",
                           metrics = "sessions", 
                           dimensions = "date",
                           max = 5000)

head(gadata)
