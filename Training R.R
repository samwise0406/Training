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