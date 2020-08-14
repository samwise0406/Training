print ("this file was created within Rstudio")

print("And now it lives in Github")

######## DATA TYPES

## MATRIX

  m=matrix(nrow=2,ncol=3)
  m=matrix(c(1:6),nrow=2,ncol=3)
  m
  
  OR
  
  n= 1:10
  dim(n)=c(2,5)
  n
  
  ##column & row binding
  x=1:3
  y=10:12
  a=cbind(x,y)
  a
  b=rbind(x,y)
  b


## FACTOR
x=factor(c("yes","yes","yes","no"))
x
table(x)
unclass(x)  ##baseline level is alphabetical by default 

##setting baseline level
x=factor(c("yes","yes","yes","no"))
levels=c("yes","no")
x

##DATA FRAME
x=data.frame(foo=1:4, bar=c(T,F,T,F))
x
ncol(x)
nrow(x)

## NAMES
# objects
x=1:3
names(x)=c("foo","bar","norf")
x

OR

# list
x=list(a=1,b=2,c=3)
x

OR

# matrices
x=matrix(1:6,nrow=2,ncol=3)
dimnames(x)=list(c("yes","no"),c("low","mid","high"))
x

##SUBSETTING
#Basics
x=c("a","b","c","d")
x[1]
x[2]
x[1:3]
x[x>"a"]
u=x>"a"
x[u]

#Lists
x=list(foo=1:4,bar=0.6,norf="hello")
x
x[1]
x[2]
x$bar 
x$b  ##OR
x$foo
x[c(1,3)]

#Matrices
x=matrix(1:6,2,3)
x[1,2]
x[2,1]
x[1,]
x[,3]
x[,3,drop=FALSE]          #returning back a matrix


##REMOVING NA VALUES
x=c(1,2,NA,4,5,NA)
bad=is.na(x)
x[!bad]

x=c(1,NA,2,NA,4,7)
y=c("a",NA,"g",NA,"e","t")
good=complete.cases(x,y)
good
x[good]
y[!good]

airquality[1:6,]
good=complete.cases(airquality)
airquality[good,][1:6,]

##CONTROL STRUCTURES
#IF
if (x>3)
{y=10} else {y=0}
x=2
y
x=5
y

OR

y=if(x>3)
{10} else {0}

#FOR
x=c("a","b","c","d")
for (i in 1:4)
{print(x[i])} 


x=c("a","b","c","d")
for(letter in x)
{print(letter)}

x=c(1,2,3,4)
for (i in x) {print (2*i)}

x=matrix(1:6,2,3)
for (i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x))){
    print (x[i,j])}
}

# WHILE
count=0
while (count<10)
{print (count)
  count=count + 1}

z=5
while(z>=3 && z<=10){
  print (z)
  coin=rbinom(1,1,0.5)
  if(coin == 1)
  {
    z = z + 1
  } else {
    z = z - 1
  }
}

##FUNCTIONS

add2=function(x,y){
  x+y
}
add2(3,5)

pol=function(x,y){
  x^2+3*x*y-2
  }
pol(3,5)

above=function(x,n){
  use=x>n
  x[use]
}
x=1:20
above(x,12)

above=function(x,n){use=x>12
x[use]
}
x=1:30
above(x)

above=function(x,n=10){use=x>n
x[use]
}
x=1:30
above(x)

##Mean of a Column 
columnmean=function(y){
  nc=ncol(y)
  means=numeric(nc)
  for(i in 1:nc){
    means[i]=mean(y[,i])}
  means
}
columnmean(airquality)

columnmean=function(y,removeNA=TRUE){
  nc=ncol(y)
  means=numeric(nc)
  for(i in 1:nc){
    means[i]=mean(y[,i],na.rm=removeNA)}
  means
}
columnmean(airquality)
columnmean(airquality,FALSE)  #BRINGING BACK THE NA

##LOOP FUNCTIONS

#lapply
x=list(a=1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
lapply(x,mean)	##returning the means as a list

x=1:4
lapply(x,runif)

x=1:4
lapply(x,runif, min=0,max=10)

#sapply
x=list(a=1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
sapply(x,mean)	##returning the means as a vector

#apply
x=matrix(rnorm(200),20,10)
apply(x,2,mean) ##preseving the columns
apply(x,1,mean)	##preseving the rows

x=matrix(rnorm(200),20,10)
apply(x,1,quantile,probs=c(0.25,0.75))   ##returning the 25% & 75% of the rows

x=array(rnorm(2*2*10),c(2,2,10))
x
apply(x,c(1,2),mean)		##mean of the 2X2 array across the 10 dimension

OR

rowMeans(x,dim=2)

#mapply
x=list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
x
mapply(rep,1:4,4:1)

noise=function(n,mean,sd){
  rnorm(n,mean,sd)			
}
noise(5,1,2)		
noise(1:5,1:5,2)
mapply(noise,1:5,1:5,2)			##VECTORIZING A FUNCTION(changing both n and mean but sd remain constant)

#OR
x=list(noise(1,1,2),noise(2,2,2),noise(3,3,2),noise(4,4,2),noise(5,5,2))
x

#tapply
x=c(rnorm(10),runif(10),rnorm(10,1))
f=gl(3,10)
f
tapply(x,f,mean)
tapply(x,f,sum)
tapply(x,f,range)

#split
x=c(rnorm(10),runif(10),rnorm(10,1))
f=gl(3,10)
split(x,f)
lapply(split(x,f),mean)
sapply(split(x,f),mean)

x=split(airquality,airquality$Month)
lapply(x,function(x)colMeans(x[,c("Ozone","Solar.R","Wind")]))

x=split(airquality,airquality$Month)
sapply(x,function(x)colMeans(x[,c("Ozone","Solar.R","Wind")]))

x=split(airquality,airquality$Month)
sapply(x,function(x)colMeans(x[,c("Ozone","Solar.R","Wind")],na.rm=TRUE))

#splitting on more than one level
x=rnorm(10)
f1=gl(2,5)
f2=gl(5,2)
f1
f2
interaction(f1,f2)
str(split(x,list(f1,f2)))
str(split(x,list(f1,f2),drop=TRUE))