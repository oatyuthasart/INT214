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


### 1. Rating เฉลี่ยของหนังสือทั้ง 270 เล่ม

```
cs %>% summarise(Mean = mean(Rating))
```

Result: 

```
4.067417
```
- ค่าเฉลี่ยเรตติ้งอยู่ที่ 4.067417 ซึ่งเป็นเกณฑ์ที่น่าพึงพอใจสำหรับผู้อ่านโดยทั่วไป ถือว่าสมเหตุสมผลสำหรับหนังสือ Top 270 เล่ม


### 2. จำนวนหนังสือของแต่ละประเภท

```
count(cs$Type)
```

Result: 

```
1.Boxed Set - Hardcover   1
2.ebook                   7
3.Hardcover               95
4.Kindle Edition          10
5.Paperback               156
6.Unknown Binding         2
```
- จำนวนที่มากที่สุดคือหนังสือประเภท หนังสือปกอ่อน ซึ่งเป็นประเภทหนังสือที่เปิดอ่านง่าย เข้าถึงได้ง่ายสำหรับทุกคน


### 3. เรตติ้งเฉลี่ยของหนังสือแต่ละประเภท

```
cs %>% filter(Type == 'Boxed Set - Hardcover') %>% summarise('Boxed Set - Hardcover' = mean(Rating))
cs %>% filter(Type == 'ebook') %>% summarise(ebook = mean(Rating))
cs %>% filter(Type == 'Hardcover') %>% summarise(Hardcover = mean(Rating))
cs %>% filter(Type == 'Kindle Edition') %>% summarise('Kindle Edition' = mean(Rating))
cs %>% filter(Type == 'Paperback') %>% summarise(Paperback = mean(Rating))
cs %>% filter(Type == 'Unknown Binding') %>% summarise('Unknown Binding' = mean(Rating))
```

Result: 

```
1.Boxed Set - Hardcover   4.49
2.ebook                   4.285714
3.Hardcover               4.059895
4.Kindle Edition          4.015
5.Paperback               4.063846
6.Unknown Binding         3.99
```
- Boxed Set - Hardcover มีค่าเฉลี่ยเรตติ้งที่ดีที่สุดเนื่องจากมีเล่มเดียวและได้เรตติ้งที่อยู่ในระดับสูง และที่รองลงมาคือประเภท ebook ซึ่งโดยรวมเรตติ้งถือว่าอยู่ในเกณฑ์ที่ดี


### 4. ค่าเฉลี่ยของจำนวนหน้าหนังสือทั้งหมด

```
cs %>% summarise(Mean = mean(Number_Of_Pages))
```

Result: 

```
475.0775
```
- โดยรวมหนังสือมีจำนวนหน้าอยู่ที่ประมาณ 475 หน้า ซึ่งเป็นจำนวนที่สมเหตุสมผลสำหรับหนังสือวิชาการด้านโปรแกรม และ วิทยาศาสตร์คอมพิวเตอร์


### 5. จำนวนหน้าเฉลี่ยของหนังสือแต่ละประเภท

```
cs %>% filter(Type == 'Boxed Set - Hardcover') %>% summarise('Boxed Set - Hardcover' = mean(Number_Of_Pages))
cs %>% filter(Type == 'ebook') %>% summarise(ebook = mean(Number_Of_Pages))
cs %>% filter(Type == 'Hardcover') %>% summarise(Hardcover = mean(Number_Of_Pages))
cs %>% filter(Type == 'Kindle Edition') %>% summarise('Kindle Edition' = mean(Number_Of_Pages))
cs %>% filter(Type == 'Paperback') %>% summarise(Paperback = mean(Number_Of_Pages))
cs %>% filter(Type == 'Unknown Binding') %>% summarise('Unknown Binding' = mean(Number_Of_Pages))
```

Result: 

```
1.Boxed Set - Hardcover   896
2.ebook                   386
3.Hardcover               614.4632
4.Kindle Edition          283.4
5.Paperback               406.6795
6.Unknown Binding         249
```
- หนังสือแต่ละประเภทมีค่าเฉลี่ยจำนวนหน้าที่ไม่เท่ากัน แต่จำนวนถือว่าสมเหตุสมผลสำหรับหนังสือด้านวิชาการ


### 6. ราคาเฉลี่ยของหนังสือแต่ละประเภท

```
cs %>% filter(Type == 'Boxed Set - Hardcover') %>% summarise('Boxed Set - Hardcover' = mean(Price))
cs %>% filter(Type == 'ebook') %>% summarise(ebook = mean(Price))
cs %>% filter(Type == 'Hardcover') %>% summarise(Hardcover = mean(Price))
cs %>% filter(Type == 'Kindle Edition') %>% summarise('Kindle Edition' = mean(Price))
cs %>% filter(Type == 'Paperback') %>% summarise(Paperback = mean(Price))
cs %>% filter(Type == 'Unknown Binding') %>% summarise('Unknown Binding' = mean(Price))
```

Result: 

```
1.Boxed Set - Hardcover   220.3853
2.ebook                   51.35
3.Hardcover               70.13449
4.Kindle Edition          32.38559
5.Paperback               45.76893
6.Unknown Binding         37.21176
```
- หนังสือแต่ละประเภทมีราคาที่ไม่ห่างกันมากเกินไป แต่ Boxed Set ราคากระโดดไปเยอะเพราะคิดว่าน่าจะเป็นที่คำว่า Set (หลายเล่ม)



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
