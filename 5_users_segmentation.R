# K-Means Cluster Analysis

# load data into R
# you can download data from Google Analytics API or download sample dataset
# source('ga-connection.R')

# download and preview sample dataset
download.file(url="https://raw.githubusercontent.com/michalbrys/R/master/users-segmentation/sample-users.csv",
              "sample-users.csv",
              method="curl")
gadata <- read.csv(file="sample-users.csv", header=T, row.names = 1)
head(gadata)

# clustering users in 3 groups
fit <- kmeans(gadata, 3)

# get cluster means 
aggregate(gadata,by=list(fit$cluster),FUN=mean)

# append  and preview cluster assignment
clustered_users <- data.frame(gadata, fit$cluster)
head(clustered_users)

# visualize results in 3D chart

#install.packages("plotly")
library(plotly)

plot_ly(clustered_users, 
        x = clustered_users$beginner_pv, 
        y = clustered_users$intermediate_pv, 
        z = clustered_users$advanced_pv, 
        type = "scatter3d", 
        mode = "markers", 
        color=factor(clustered_users$fit.cluster)
)

# write results to file
write.csv(clustered_users, "clustered-users.csv", row.names=T)