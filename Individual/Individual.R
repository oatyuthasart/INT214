library(dplyr)
library(stringr)
library(tidyr)
library(assertive)
library(readr)
library(tidyr)
library(plyr)
library(ggplot2)

cs <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
View(cs)

#1
cs %>% summarise(Mean = mean(Rating))

#2
count(cs$Type)

#3
cs %>% filter(Type == 'Boxed Set - Hardcover') %>% summarise('Boxed Set - Hardcover' = mean(Rating))
cs %>% filter(Type == 'ebook') %>% summarise(ebook = mean(Rating))
cs %>% filter(Type == 'Hardcover') %>% summarise(Hardcover = mean(Rating))
cs %>% filter(Type == 'Kindle Edition') %>% summarise('Kindle Edition' = mean(Rating))
cs %>% filter(Type == 'Paperback') %>% summarise(Paperback = mean(Rating))
cs %>% filter(Type == 'Unknown Binding') %>% summarise('Unknown Binding' = mean(Rating))

#4
cs %>% summarise(Mean = mean(Number_Of_Pages))

#5
cs %>% filter(Type == 'Boxed Set - Hardcover') %>% summarise('Boxed Set - Hardcover' = mean(Number_Of_Pages))
cs %>% filter(Type == 'ebook') %>% summarise(ebook = mean(Number_Of_Pages))
cs %>% filter(Type == 'Hardcover') %>% summarise(Hardcover = mean(Number_Of_Pages))
cs %>% filter(Type == 'Kindle Edition') %>% summarise('Kindle Edition' = mean(Number_Of_Pages))
cs %>% filter(Type == 'Paperback') %>% summarise(Paperback = mean(Number_Of_Pages))
cs %>% filter(Type == 'Unknown Binding') %>% summarise('Unknown Binding' = mean(Number_Of_Pages))

#6
cs %>% filter(Type == 'Boxed Set - Hardcover') %>% summarise('Boxed Set - Hardcover' = mean(Price))
cs %>% filter(Type == 'ebook') %>% summarise(ebook = mean(Price))
cs %>% filter(Type == 'Hardcover') %>% summarise(Hardcover = mean(Price))
cs %>% filter(Type == 'Kindle Edition') %>% summarise('Kindle Edition' = mean(Price))
cs %>% filter(Type == 'Paperback') %>% summarise(Paperback = mean(Price))
cs %>% filter(Type == 'Unknown Binding') %>% summarise('Unknown Binding' = mean(Price))


#ggplot2
scat_plot <- cs %>% ggplot(aes(x=Price, y=Rating))+
  geom_point(aes(color=Type))

scat_plot+geom_smooth()

scat_plot2 <- cs %>% ggplot(aes(x=Reviews, y=Rating))+
  geom_point(aes(color=Type))

scat_plot2+geom_smooth()


#Tidyverse(stringr) example

Test <- c("Hello", "My", "Name", "Is", "Oat", "Kub")
str_c(Test, collapse = "?????? ")

str_sub(Test, 1, 2)

str_subset(Test, "[aeiou]")




