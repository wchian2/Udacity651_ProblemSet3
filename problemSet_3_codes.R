# Load ggplot2 package and 'diamonds' data set
library(ggplot2)
data(diamonds)
summary(diamonds)

# Create a histogram of the price of all the diamonds in the diamond data set
qplot(x = price, data = diamonds)

# Shape is right-skewed
summary(diamonds$price)
# Mean (3933) is more on the right than the median (2401)

# Number of diamonds costing less than $500
dim(subset(diamonds, price < 500))
# Number of diamonds costing less than $250
dim(subset(diamonds, price < 250))
# Number of diamonds costing $15,000 *or* more
dim(subset(diamonds, price >= 15000))

# Explore the largest peak in the price histogram and save image
qplot(x = price, data = diamonds, color = I('black'), fill = I('#009999'), binwidth = 25) +
  scale_x_continuous(limits= c(0,2500), breaks = seq(0,2400,200))
ggsave('priceHistogram.png')
# Most common price of diamond is in the range of $600 - $800

# Break out the histogram of diamond prices by cut
qplot(x = price, data = diamonds, color = I('black'), fill = I('#009999'), binwidth = 500) +
  facet_wrap(~cut)
# To determine which cut has (1) the highest priced diamond, (2) the lowest priced diamond, and
# (3) the lowest median price
by(diamonds$price,diamonds$cut,summary, digits = max(getOption('digits')))

# Like the previous qplot code but with added facet_wrap parameter implemented so that the
# y-axis in the histogram is not fixed
qplot(x = price, data = diamonds, color = I('black'), fill = I('#009999'), binwidth = 500) +
  facet_wrap(~cut, scales = "free_y")

# Create a histogram of price per carat and facet it by cut
qplot(x = price/carat, data = diamonds, color = I('black'), fill = I('#009999'), binwidth = 500) +
  facet_wrap(~cut, scales = "free_y")
# Adjust the bin width and transform the scale of the x-axis using log10
qplot(x = log10(price/carat), data = diamonds, color = I('black'), fill = I('#009999'), binwidth = 0.05) + 
  facet_wrap(~cut, scales = "free_y")

# Investigate the price of diamonds using box plots, numerical summaries, and one of the following
# categorical variables: cut, clarity, or color
# BOX PLOT - by cut
qplot(x = cut, y = price, data = diamonds, geom = "boxplot") +
  coord_cartesian(ylim = c(0, 7000))
# BOX PLOT - by clarity
qplot(x = clarity, y = price, data = diamonds, geom = "boxplot") +
  coord_cartesian(ylim = c(0, 7000))
# BOX PLOT - by color
qplot(x = color, y = price, data = diamonds, geom = "boxplot") +
  coord_cartesian(ylim = c(0, 8000))
# Numerical summaries
by(diamonds$price, diamonds$color, summary)

# Boxplot illustrating the price per carat of diamonds across the different colors of diamonds
qplot(x = color, y = price/carat, data = diamonds, geom = "boxplot")

# Illustration of a frequencies polygon according to carats of diamonds
qplot(x = carat,
      data = diamonds,
      binwidth = 0.01,
      geom = 'freqpoly') +
  scale_x_continuous(lim = c(0,3), breaks = seq(0,3,0.3))

