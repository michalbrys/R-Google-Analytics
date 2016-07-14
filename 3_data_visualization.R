# basic visualizations

# install libraries
# install.packages("googleAuthR")
# install.packages("googleAnalyticsR")
# install.packages("ggplot2")

# load libraries
library("googleAuthR")
library("googleAnalyticsR")
library("ggplot2")

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

# line chart
ggplot(gadata,aes(x=date,y=sessions,group=1)) +
  geom_line() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) # some styles to pivot x-axis labels


# scatter plot
ggplot(gadata, aes(x=date, y=sessions)) +
  geom_point()

ggplot(gadata, aes(x=date, y=sessions)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) # styling x-axis

# scatter plot - point size
ggplot(gadata, aes(x=date, y=sessions, size = sessions)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# scatter plot - point color
ggplot(gadata, aes(x=date, y=sessions, size = sessions, color = sessions)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# scatter plot with trend line
ggplot(data = gadata, aes(x = gadata$date,y = gadata$sessions) ) + 
  geom_point() + 
  geom_smooth() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# box plot
gadata2 <- google_analytics(id = ga_id, 
                           start="2016-01-01", end="2016-06-30", 
                           metrics = c("sessions","avgSessionDuration"),
                           dimensions = c("dayOfWeek","date"),
                           max = 5000)

ggplot(data = gadata2, aes(x = dayOfWeek, y = sessions)) + 
  geom_boxplot()

ggplot(data = gadata2, aes(x = dayOfWeek, y = avgSessionDuration)) + 
  geom_boxplot()