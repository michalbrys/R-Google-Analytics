# Code for start using Google Analytics data in R

## Contents

* Hello world example
* Basic exploratory data analysis
* Data visualizations
* Users segmentation

### Hello world example

Conect to Google Analytics from R and download basic data.

### Basic exploratory data analysis

Learn about dataset:
* Calculate basic statistics (min, max, mean, median, standard deviation)

* Plot histogram to check distribution

![google analytics r histogram](./plots/2_sessions_histogram.png)

* Plot line chart to check values in times

![google analytics r histogram](./plots/2_sessions_in_time.png)

* Prepare subset with days with low and high traffic

### Data visualizations

* Basic line chart - sessions in time

![google analytics r histogram](./plots/3_line_chart.png)

* Basic scatter plot - sessions in time

![google analytics r histogram](./plots/3_scatter_plot.png)

* Scatter plot with point size and color (bubble chart) - sessions in time

![google analytics r histogram](./plots/3_bubble_chart.png)

* Scatter plot with trend line - sessions in time

![google analytics r histogram](./plots/3_sessions_time_scatter_trend.png)


* Box plot - sessions distribution by dayOfWeek

![google analytics r histogram](./plots/3_sessions_dayOfWeek_boxplot.png)

### Forecasting

Forecasting web traffic using Holt-Winters method.  Inspired by [Richard Fergie](https://github.com/richardfergie)

![google analytics r forecasting](./plots/4_forecasting.png)

### Users segmentation

Clustering website users by interests using k-means method and visualization in 3D scatter plot using `plotly`.

![google analytics r clustering](./plots/5_clustering.gif)

### Web traffic heatmap

Create heatmap of web traffic. Inspired by [Todd Moy](https://github.com/toddmoy)

![google analytics r clustering](./plots/6_heatmap.png)

### Device comparsion

Compare behavior of different user segments (by deviceCategory).

![google analytics r clustering](./plots/7_bar_chart.png)



## Others resources

All cases using library `googleAnalyticsR` by  [Mark Edmonson](https://github.com/MarkEdmondson1234)
