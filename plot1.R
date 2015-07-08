#Read the txt file
electric<-read.table("./household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F)

#Converting the Date which is stored as a string into Dates.
electric$Date<-as.Date(strptime(electric$Date,format="%d/%m/%Y"))

#Subset out Dates 2007-02-01 & 2007-02-02 & call the dataframe elec
elec<-electric[(electric$Date=="2007-02-01")|(electric$Date=="2007-02-02"),]

#Create a new variable called Date.Time which combines Date & Time together.
elec$Date.Time<-paste(elec$Date,elec$Time)
elec$Date.Time<-strptime(elec$Date.Time,format="%Y-%m-%d %H:%M:%S")

#Creating the first plot
png(filename="plot1.png",width=480,height=480,bg="transparent")
hist(as.numeric(elec$Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
