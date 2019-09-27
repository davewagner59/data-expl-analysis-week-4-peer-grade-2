## ASSIGNMENT
## THE OVERALL GOAL OF THIS ASSIGNMENT IS TO EXPLORE THE NATIONAL EMMISIONS INVENTORY
## DATABASE AND SEE WHAT IT SAYS ABOUT PARTICULATE MATTER POLLUTION IN THE UNITED STATES
## OVER A TEN YEAR PERIOD 1999-2008. MAKE RELEVANT PLOTS IN ORDER TO ANSWER THE QUESTIONS.

## READ IN THE 2 RDS SUPPLIED FOR THE PROJECT

## QUESTION: HAVE TOTAL PM25 EMISSIONS IN BALTIMORE DECREASED?
## ANSWER: IN 2008, THEY ARE THE LOWEST, BUT DURING THE 1999-2008 FLUCTUATED HIGHER AND LOWER.


NEI <- readRDS("~/DS mod4 wk4 proj/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC<- readRDS("~/DS mod4 wk4 proj/exdata_data_NEI_data/Source_Classification_Code.rds")

##  AGGREGATE DATA AND SUM BY YEAR
Balt_NEI  <- NEI[NEI$fips=="24510", ]

BALTCITY_PM25 <- aggregate(Emissions ~ year, Balt_NEI, sum)

png('plot2.png')
barplot(height=BALTCITY_PM25$Emissions, names.arg=BALTCITY_PM25$year, xlab="years",
        ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'),col= "orange")
dev.off()