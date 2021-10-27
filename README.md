# Individual Assignment

**Created by นายยุทธศาสตร์ ประจักษ์สุวรรณ (ID: 63130500097)**

Choose Dataset:
1. Top 270 Computer Science / Programing Books (Data from Thomas Konstantin, [Kaggle](https://www.kaggle.com/thomaskonstantin/top-270-rated-computer-science-programing-books)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv)


### Outlines
1. Explore the dataset
2. Transform data with dplyr and finding insight the data
3. Visualization with GGplot2
4. Tidyverse example

## Part 1: Explore the dataset

```
# Library
library(dplyr)
library(stringr)
library(tidyr)
library(assertive)
library(readr)
library(tidyr)
library(plyr)

# Dataset
cs <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
```

In this dataset has Top 270 Computer Science / Programing Books

## Part 2: Transform data with dplyr and finding insight the data

1. Rating เฉลี่ยของหนังสือทั้ง 270 เล่ม

```
cs %>% summarise(Mean = mean(Rating))
```

Result: 

```
4.067417
```
- ค่าเฉลี่ยเรตติ้งอยู่ที่ 4.067417 ซึ่งเป็นเกณฑ์ที่น่าพึงพอใจสำหรับผู้อ่านโดยทั่วไป ถือว่าสมเหตุสมผลสำหรับหนังสือ Top 270 เล่ม


## Part 3: Visualization with GGplot2
### 1.) Graph show relation between height and mass
```
scat_plot <- starwars %>% filter(mass<500) %>% ggplot(aes(x=height,y=mass))+
  geom_point(aes(color=gender))

scat_plot+geom_smooth()
```
Result:

![Graph 1](graph1.png)

**Guideline:
Embed Image by using this syntax in markdown file
````
![Name](imageFile)
````
