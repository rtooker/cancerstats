# libraries for branding (could these be loaded via the CRUKBrand library??)

#load CRUK brand defaults - need to install CRUKBrand, using devtools install_github, eg:
# > install.packages(devtools)
# > library(devtools)
# > install_github("rtooker/CRUKBrand")
library(CRUKBrand)

#create some sample data
variable1<-rnorm(200,sd=3) #200 random points from normal dist
variable2<-variable1 * .4 + rnorm(200,sd=.5) #correlated variable
category<-sample(c("A","B","C"),200,replace=T) #categorical variable

df<-data.frame(variable1,variable2,category) #put in data frame

rm(list=c("variable1","variable2","category")) #delete unneeded variables

p <- NULL
p <- qplot(x=variable1,y=variable2,data=df,color=category,geom="point") + 
  labs(title="Bone Sarcoma (C40-C41): 1979-2013", 
       subtitle="European Age-Standardised Incidence Rates per 100,000 Population, by Sex, Great Britain",
       x="Year of Diagnosis",
       y="Rate Per 100,000",
       color="Sex")

# applybrand
g <- applyCRUKBrand(p)
grid.draw(g)

