# Load data
setwd("/Users/alexengler/Desktop")

# setwd("/Users/Documents/Wherever you need it")

hotdogs <- read.csv("hotdogs.csv", sep=",", header=TRUE)

hotdogs <- read.csv("hotdogs.csv")
# Remember - anything after a '#' is a note, and will have no effect if you try to run it in R.

head(hotdogs)
dim(hotdogs)


# Default barchart - barplot is a 'function'
barplot(hotdogs$Dogs.eaten)

# Year labels - this function has an additional 'argument'
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year)


# Axis labels
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, xlab="Year", ylab="Hot dogs and buns eaten")

# Fill color and border
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col="#475BBF", border=NA, xlab="Year", ylab="Hot dogs and buns eaten")



# Highlight USA colors
hotdogs$fill_colors <- ""
hotdogs$fill_colors[which(hotdogs$Country == "United States")] <- "#821122"
hotdogs$fill_colors[which(hotdogs$Country != "United States")] <- "#cccccc"

## These six digits Hex codes are the easiest way to work with colors in R.
## Here are some places you can find more Hex codes:
## https://color.adobe.com/create/color-wheel/
## http://colorbrewer2.org/

barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col=hotdogs$fill_colors, border=NA, xlab="Year", ylab="Hot dogs and buns (HDB) eaten")


hotdogs$fill_colors[which(hotdogs$Winner == "Joey Chestnut ")] <- "#54278f"
hotdogs$fill_colors[which(hotdogs$Winner != "Joey Chestnut ")] <- "#cccccc"


barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col=hotdogs$fill_colors, border=NA, xlab="Year", ylab="Hot dogs and buns (HDB) eaten")


# Highlight record years with color
hotdogs$fill_colors <- "#cccccc"
hotdogs$fill_colors[which(hotdogs$New.record == 1)] <- "#821122"


barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col=hotdogs$fill_colors, border=NA, xlab="Year", ylab="Hot dogs and buns (HDB) eaten")



barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col=hotdogs$fill_colors, border=NA, space=0.5, xlab="Year", ylab="Hot dogs and buns (HDB) eaten")

# Main title
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col=hotdogs$fill_colors, border=NA, space=0.25, xlab="Year", ylab="Hot dogs and buns (HDB) eaten", main="Nathan's Hot Dog Eating Contest Results, 1980-2010")

# Spacing does not matter
barplot(height=hotdogs$Dogs.eaten
	, names.arg=hotdogs$Year
	, col=hotdogs$fill_colors
	, space=0.6
	, border="#000000"
	, xlab="Year"
	, ylab="Hot dogs and buns (HDB) eaten"
	, main="Nathan's Hot Dog Eating Contest Results, 1980-2010")


## subset of a dataframe - notice the comma
hotdogs[which(hotdogs$Year == "1980"),]
hotdogs[which(hotdogs$Year %in% c("1990","1991","1995")),]
hotdogs[which(hotdogs$Dogs.eaten >= 25),]

## subset of a column - notice there is no comma
hotdogs$Winner[which(hotdogs$Dogs.eaten >= 25)]

## reordering data - making a new data set
new_data <- hotdogs[order(hotdogs$Winner),]

## reordering data - replacing the original dataset
hotdogs <- hotdogs[order(hotdogs$Winner),]




# Load unemployment data
unemployment <- read.csv("http://datasets.flowingdata.com/unemployment-rate-1948-2010.csv", sep=",")
unemployment[1:10,]

dim(unemployment)
head(unemployment)


plot(unemployment$Year, unemployment$Value)

plot(unemployment$Year, unemployment$Value
	, main = "US Unemployment Rate Over Time"
	, ylab = "Unemployment Percent"
	, xlab = "Year"
	, col = "red"
	, type = "p")



scatter.smooth(unemployment$Year
	, unemployment$Value)


scatter.smooth(unemployment$Year
	, unemployment$Value
	, col="red"
	, ylim = c(0,12)
	, degree = 2
	, span = 0.2)


# Scatter plot with loess
scatter.smooth(unemployment$Year, unemployment$Value, degree=2, col="red", span=0.5, ylim = c(0,11), xlab = "Year", ylab = "Unemployment Rate")

