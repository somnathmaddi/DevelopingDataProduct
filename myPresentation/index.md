---
title       : Presentation for my Shiny App
subtitle    : mtcars dataset
author      : Somnath Maddi
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## About Application

Link of Application on github shiny server : http://yogidhiman.shinyapps.io/my_shiny_app

This Application can be used to play around and find relationship between any two numeric variable in a dataset under one factor variable levels.

1. Application to study relation between any two numerical variables, considering group effect
2. Two Sections of Application
    - Sidebar Panel : Make you select any two variables along with any one group in mtcars dataset.  
    - Main Panel : Plots the scatter plot between two selected variables group by the factor variable. 
3. A correlation between the two selected variables is also shown.

--- .class #id 

## Explaining Output

Main Panel : Plotting the points between two variables using formula

```
scatterplot(mpg,disp,main="mtcars",xlab=mpg,ylab=disp,smoother=FALSE,groups=gear,
                legend.coords="bottomright",legend.title="Gear",boxplots="xy")
```
Finding the correlation between any two selected variables. e.g. by default mpg is chosen as x variable and disp is chosen as y variable and thus correlation shown as 

```r
attach(mtcars)
cor(mpg, disp)
```

```
## [1] -0.8476
```


--- .class #id 


## How to run the applicataion

1. Copy the shiny code folder present in my github respository to your D: drive
2. Load library shiny using library(shiny) command in your R Studio Environment
3. runApp("D:\\shiny code\\")
4. Play with the simple application by choosing Y Variable and X Variable along with interaction effect of factor variable
5. See the correlation 


--- .class #id 


## Conculsion

1. The Dataset used is mtcars dataset in car library

```r
names(mtcars)  #give the name of the variables used
```

```
##  [1] "mpg"  "cyl"  "disp" "hp"   "drat" "wt"   "qsec" "vs"   "am"   "gear"
## [11] "carb"
```

2.Following variables are converted to factor variables 


```r
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$gear <- as.factor(mtcars$gear)  # no. of forward gears
mtcars$carb <- as.factor(mtcars$carb)  # Number of carburetors
mtcars$am <- as.factor(mtcars$am)  # Transmission (0 = automatic, 1 = manual)
mtcars$vs <- as.factor(mtcars$vs)
```



--- .class #id 

## Conculsion (Cont .....)

1.  server.R file is used to load mtcars dataset 
    
      selectedData() function is used to make dataset of two continuous variables and one factor variable as selected.

2.  ui.R file is used for shiny user interface.

      based on selected data user is shown,a scatter plot of the selected variables along with a boxplot of variables along each axis and their correlation.
      
3.  Application Main purpose is to Explore relationship between two numeric variables.

4. A snapshot of the application is present in the very folder you copied from the github repository
      
      

