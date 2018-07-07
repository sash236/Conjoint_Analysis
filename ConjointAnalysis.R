# load 'conjoint' library
library(conjoint)

# Reading of the survey results
data <- read.csv("Dataconjoint.csv", header = TRUE, sep = ","  )

# Reading of the attributes of the smartphones
conj <- read.csv("conjoint.csv", header = TRUE, sep = ","  )
lev <- c("apple","samsung","other","local","3.5","4,5","5.5","32","64","128","8","12","3","4","5","6","7","8","9")
lev.df <- data.frame(lev)

lev <- c("apple","samsung","other","local","3.5in","4.5in","5.5in","32GB","64GB","128GB","8MP","12MP","$299","$399","$499","$599","$699","$799","$899")
lev.df <- data.frame(lev)


# Get utilities of each attributes
caModel(y=data[1,2:31],x=conj[,6:10]) # For one line only
# Conjoint(data[,2:31],conj[,1:5]) # For full model
Conjoint(data[,2:31],conj[,6:10],z=lev.df) # For full model

#caImportance(data[,2:31],conj[,6:10],z=lev.df)
caImportance(data[,2:31],conj[,6:10])

caSegmentation(data[,2:31],conj[,6:10],c=3)