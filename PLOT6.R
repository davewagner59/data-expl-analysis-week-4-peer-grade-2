## ASSIGNMENT
## THE OVERALL GOAL OF THIS ASSIGNMENT IS TO EXPLORE THE NATIONAL EMMISIONS INVENTORY
## DATABASE AND SEE WHAT IT SAYS ABOUT PARTICULATE MATTER POLLUTION IN THE UNITED STATES
## OVER A TEN YEAR PERIOD 1999-2008. MAKE RELEVANT PLOTS IN ORDER TO ANSWER THE QUESTIONS.

## READ IN THE 2 RDS SUPPLIED FOR THE PROJECT

##QUESTION:BETWEEN LA AND BALTIMORE, WHICH CITY GREATER CHANGES OVER TIME WITH 
## VEHICLE EMISSIONS?
## ANSWER: BALTIMORE SHOWED MORE AGGRESSIVE DECREASE IN VEHICLE EMISSIONS THAN LOS ANGELES.

NEI <- readRDS("~/DS mod4 wk4 proj/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC<- readRDS("~/DS mod4 wk4 proj/exdata_data_NEI_data/Source_Classification_Code.rds")

NEISCC <- merge(NEI, SCC, by="SCC")

## PARSE OUT EMMISSION DATA FOR BALIMORE AND ON-ROAD
LA_BALTNEI <- NEI[(NEI$fips=="24510"| NEI$fips=="06037") & NEI$type=="ON-ROAD",]

AGGDATA <- aggregate(Emissions ~ year + fips, LA_BALTNEI, sum)

png("PLOT6.png")

barplot(AGGDATA$Emissions,names.arg =AGGDATA$year, col = AGGDATA$fips, 
        xlab = 'LA  *****   Years data collected  ****   Baltimore',
        ylab= 'Aggregated PM25 Emissions from Vehicles by city',
        main='Emissions from Los Angeles vs.
        Balitmore')

dev.off()

