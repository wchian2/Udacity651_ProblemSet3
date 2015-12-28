# Read health data
health <- read.csv('indicator_government_health_spending1.csv')

# Rename column labels
colnames(health) <- c("Country", 1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010)

# Install reshape2 package used to reshape the health data frame
library(reshape2)
reshaped_health <- melt(health)
colnames(reshaped_health) <- c("Country", "Year", "Cost")

# Create plot of the change in healthcare expenditures over time for the United States, United Kingdom,
# Canada, Germany, and France
ggplot(reshaped_health, aes(x = Year, y = Cost, color = Country)) +
  geom_point(data = subset(reshaped_health, Country %in% c("United States", "United Kingdom", "Canada", "Germany","France")), size = 3) +
  ggtitle("Total Government Healthcare Expenditures from 1995 to 2010")

# Save the plot created
ggsave('point_graph_healthExpenditures.png')