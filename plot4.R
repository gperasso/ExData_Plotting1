
dataset <-read.csv("household_power_consumption.txt",sep=";", header=TRUE, stringsAsFactors=FALSE)

dataFeb12 <- dataset[which(dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007" ), ]
remove(dataset)
dataFeb12$DateTime = paste(dataFeb12$Date,dataFeb12$Time, sep=" ")
dataFeb12$Date = as.Date(strptime(dataFeb12$Date, format="%d/%m/%Y"))
dataFeb12$DateTime = strptime(dataFeb12$DateTime, format="%d/%m/%Y %H:%M:%S")
dataFeb12$Global_active_power = as.numeric(dataFeb12$Global_active_power)
dataFeb12$Global_reactive_power = as.numeric(dataFeb12$Global_reactive_power)
dataFeb12$Voltage = as.numeric(dataFeb12$Voltage)
dataFeb12$Global_intensity = as.numeric(dataFeb12$Global_intensity)
dataFeb12$Sub_metering_1 = as.numeric(dataFeb12$Sub_metering_1)
dataFeb12$Sub_metering_2 = as.numeric(dataFeb12$Sub_metering_2)
dataFeb12$Sub_metering_3 = as.numeric(dataFeb12$Sub_metering_3)


png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) #, mar = c(1, 3, 1, 1), oma = c(2, 2, 2, 2)
with(dataFeb12,{ 
  plot(DateTime,  type = "l",Global_active_power, main =" ", xlab = "", ylab ="Global Active Power") 
  plot(DateTime,  type = "l",Voltage, main =" ", ylab ="Voltage") 
  plot(DateTime,  type = "l",Sub_metering_1, col ="GREY", main =" ", xlab = "", ylab ="Energy Sub Metering") 
  lines(DateTime, Sub_metering_2, col ="RED")
  lines(DateTime, Sub_metering_3, col ="BLUE")
  legend("topright", lty = 1, col = c("grey", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
  plot(DateTime,  type = "l",Global_reactive_power, main ="") 
  
})
dev.off()
