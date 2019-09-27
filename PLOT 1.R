## ASSIGNMENT
## THE OVERALL GOAL OF THIS ASSIGNMENT IS TO EXPLORE THE NATIONAL EMMISIONS INVENTORY
## DATABASE AND SEE WHAT IT SAYS ABOUT PARTICULATE MATTER POLLUTION IN THE UNITED STATES
## OVER A TEN YEAR PERIOD 1999-2008. MAKE RELEVANT PLOTS IN ORDER TO ANSWER THE QUESTIONS.

## READ IN THE 2 RDS SUPPLIED FOR THE PROJECT

NEI <- readRDS("~/DS mod4 wk4 proj/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC<- readRDS("~/DS mod4 wk4 proj/exdata_data_NEI_data/Source_Classification_Code.rds")

##  AGGREGATE DATA AND SUM BY YEAR
AGGDATA <- aggregate(Emissions ~ year, NEI, sum)

png("Plot1.png")


barplot(height=AGGDATA$Emissions, names.arg=AGGDATA$year, xlab="Year", 
        ylab=expression('Total PM'[2.5]*' emission'),
        col = "blue",main=expression('Total PM'[2.5]*' emissions at various years'))

dev.off()




