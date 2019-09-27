## ASSIGNMENT
## THE OVERALL GOAL OF THIS ASSIGNMENT IS TO EXPLORE THE NATIONAL EMMISIONS INVENTORY
## DATABASE AND SEE WHAT IT SAYS ABOUT PARTICULATE MATTER POLLUTION IN THE UNITED STATES
## OVER A TEN YEAR PERIOD 1999-2008. MAKE RELEVANT PLOTS IN ORDER TO ANSWER THE QUESTIONS.

## READ IN THE 2 RDS SUPPLIED FOR THE PROJECT

## QUESTION: WHICH OF THE FOUR SOURCES OF PM25 EMISSIONS (POINT, NONPOINT, ONROAD, NONROAD)HAVE SEEN
## INCREASES IN EMISSIONS FROM 1998-2008?
  
## ANSWER: POINT EMMISIONS SHOWN THE MOST INCREASE UNTIL 2005, BUT DECREASED SHARPLY IN 2008. 
## THE REST HAVE SHOWN GRADUAL DECREASES.


library(ggplot2)

NEI <- readRDS("~/DS mod4 wk4 proj/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC<- readRDS("~/DS mod4 wk4 proj/exdata_data_NEI_data/Source_Classification_Code.rds")

##  AGGREGATE DATA AND SUM BY YEAR

BALTCITYDATA <- subset(NEI,NEI$fips =="24510")
BALTAGGDATA <- aggregate(Emissions ~ year + type, BALTCITYDATA, sum)

png("PLOT3.png")

g <- ggplot(BALTAGGDATA, aes(year, Emissions, color = type))

g <- g + geom_line() +   xlab("year") +  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland by type from 1999 to 2008')

dev.off()