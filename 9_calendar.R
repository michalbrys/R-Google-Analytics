# calendar example
# Inspired by: https://www.tatvic.com/blog/calender-heatmap-with-google-analytics-data/

# install libraries
# install.packages("googleAuthR")
# install.packages("googleAnalyticsR")
# install.packages("quantmod")
# install.packages("ggplot2")
# install.packages("reshape2")
# install.packages("plyr")
# install.packages("scales")
# install.packages("zoo")

# load libraries
library("googleAuthR")
library("googleAnalyticsR")
library("quantmod")
library("ggplot2")
library("reshape2")
library("plyr")
library("scales")
library("zoo")

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
                           start="2015-01-01", end="2016-12-31",
                           metrics = "sessions", 
                           dimensions = "date",
                           max = 5000)

head(gadata)

# Run commands listed below - data wrangling
gadata$year <- as.numeric(format(as.Date(gadata$date),"%Y"))
gadata$month <- as.numeric(format(as.Date(gadata$date),"%m"))
gadata$monthf <- factor(gadata$month,levels=as.character(1:12),
                      labels=c("Jan","Feb","Mar","Apr","May","Jun",
                               "Jul","Aug","Sep","Oct","Nov","Dec"),
                      ordered=TRUE)
gadata$weekday <- as.POSIXlt(gadata$date)$wday
gadata$weekday[gadata$weekday==0] <- 7
gadata$weekdayf <- factor(gadata$weekday,levels=rev(1:7),
                        labels=rev(c("Mon","Tue","Wed","Thu","Fri","Sat","Sun")),
                        ordered=TRUE)
gadata$yearmonth <- as.numeric(format(as.Date(gadata$date),"%Y%m"))
gadata$yearmonthf <- factor(gadata$yearmonth)
gadata$week <- as.numeric(format(as.Date(gadata$date,format="%Y%m%d"),"%W"))
gadata <- ddply(gadata,.(yearmonthf),transform,monthweek=1+week-min(week))

# Plot for calendar
calendar_sessions <- ggplot(gadata, aes(monthweek, weekdayf, fill = sessions)) +
  geom_tile(colour = "white") +
  facet_grid(year~monthf) +
  scale_fill_gradient(high="#3182bd",low="#deebf7") +
  labs(title = "Calendar") +
  xlab("Week of month") +
  ylab("")

# View calendar
calendar_sessions

