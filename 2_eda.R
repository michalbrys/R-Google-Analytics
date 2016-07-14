# some exploratory data analysis

# install libraries
# install.packages("googleAuthR")
# install.packages("googleAnalyticsR")

# load libraries
library("googleAuthR")
library("googleAnalyticsR")

# authorize connection with Google Analytics servers
ga_auth()

## pick a profile with data to query
#ga_id <- account_list[275,'viewId']

# or give it explicite using tool http://michalbrys.github.io/ga-tools/table-id.html in format 99999999
ga_id <- 00000000

gadata <- google_analytics(id = ga_id, 
                           start="2016-01-01", end="2016-06-30", 
                           metrics = c("sessions"),
                           dimensions = c("date"),
                           max = 5000)

# display all results
gadata

# display top or bottom results
head(gadata)
tail(gadata)

# descriptive stats
min(gadata$sessions)
max(gadata$sessions)
mean(gadata$sessions)
median(gadata$sessions)
sd(gadata$sessions)

# plot histogram
hist(gadata$sessions)

# summary of dataset
summary(gadata)

# basic plot
plot(gadata$date,gadata$sessions, type="l")

# days with min and max number of sessions
subset(gadata, gadata$sessions == max(gadata$sessions))
subset(gadata, gadata$sessions == min(gadata$sessions))

# days with number of sessions above the mean
subset(gadata, gadata$sessions >= mean(gadata$sessions))