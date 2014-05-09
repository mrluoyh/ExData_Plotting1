datatype <- c("character","character",rep("numeric",7))
dataname <- read.table("~/Documents/References/Data Science/Exploratory Data Analysis/workingdirectory/household_power_consumption.txt",sep=";",nrows=1,stringsAsFactors=FALSE)
data <- read.table("~/Documents/References/Data Science/Exploratory Data Analysis/workingdirectory/household_power_consumption.txt"
                   ,header=FALSE,sep=";",skip=50000,nrows=30000,stringsAsFactors=FALSE
                   ,col.names=dataname)
data$Date <- as.character(data$Date)
data$Time <- as.character(data$Time)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
dataRange <- as.Date(c("2007-02-01","2007-02-02"),format="%Y-%m-%d")
df <- data[data$Date %in% dataRange,]
png("plot2.png")
plot(df$Time,df$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()