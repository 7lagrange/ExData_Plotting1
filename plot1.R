
##Reads in the power consumption data
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

##Reformats the "Date" variable to as.Date object type
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

##Combines Date and Time data into a single DateTime variable with POSIXct object type
household_power_consumption$DateTime <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time), "%Y/%m/%d %H:%M:%S")

##Subsets out the data from just 2007-02-01 and 2007-02-02
powersub <- subset(household_power_consumption, as.Date(Date) == "2007-02-01" | as.Date(Date) == "2007-02-02")

##Creates Histogram
hist(powersub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (killowats)", 
     col = "red", ylim = c(0, 1200), breaks = 12)

##Saves .png file
dev.copy(png, file = "plot1.png")
dev.off()

