# Doit R 데이터 분석 01) R의 기초

# 변수: '변하는 수'
#- 데이터 분석은 변수 간에 어떤 관계가 있는지 파악하는 작업

a = 1
a

b = 2 
b

c = 3
c

d = 3.5
d

a+b
a+b+c
4/b
5*b

# 변수에 여러 개의 값 넣기
var1 = c(1, 2, 5, 7, 8)
var1

var2 = c(1:5)
var2

var3 = seq(1, 5)  # 1~5까지 연속 값으로 var3 생성
var3

var4 = seq(1, 10, by = 2)
var4

var5 = seq(1, 10, by = 3)
var5

var1 + 2

var1 + var2

# 문자로 된 변수 만들기
str1 = "a"
str1

str2 = "text"
str2

str3 = "Hello World!"
str3

str4 = c("a", "b", "c")
str4

str5 = c("Hello!", "World", "is", "good!")
str5
# 문자로 된 변수는 연산할 수 없다!!!

# 함수
#- 데이터 분석은 '함수를 이용해서 변수를 조작하는 일'

# 변수 만들기
x = c(1, 2, 3)
x

# 함수 적용하기
mean(x)

max(x)
min(x)

# 문자를 다루는 함수 이용하기
str5

paste(str5, collapse = ",")  # 쉼표를 구분자로 str5의 단어들을 하나로 합치기
paste(str5, collapse = " ")  # 쉼표 대신 빈칸을 지정해 한칸 띄우고 합치기

# 패키지 : 함수 꾸러미

# ggplot2 package!!
# ggplot2 package install!
install.packages("ggplot2")
library(ggplot2)

x = c("a", "a", "b", "c")
x

# 빈도 막대 그래프 출력
qplot(x)

head(mpg, 3)

# data에 mpg, x축에 hwy 변수 지정해 그래프 생성
qplot(data = mpg, x = hwy)

# x축 cty
qplot(data = mpg, x = cty)

# x축 drv, y축 hwy
qplot(data = mpg, x = drv, y = hwy)

# x축 drv, y축 hwy, 선 그래프 형태
qplot(data = mpg, x = drv, y = hwy, geom = "line")

# x축 drv, y축 hwy, 상자 그림 형태
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")

# x축 drv, y축 hwy, 상자 그림 형태, drv 별 색 표현
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)


## 혼자서 해보기
# Q1. 시험 점수 변수 만들고 출력하기
score = c(80, 60, 70, 50, 90)
score

# Q2. 전체 평균 구하기
mean(score)

# Q3. 전체 평균 변수 만들고 출력하기
mean_score = mean(score)
mean_score