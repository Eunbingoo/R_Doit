# Doit R 데이터 분석 03) 데이터 파악 및 수정

# 데이터 파악하기
getwd()
# 기본 함수들
# head() - 데이터 앞부분 출력
# tail() - 데이터 뒷부분 출력
# View() - 뷰어 창에서 데이터 확인
# dim() - 데이터 차원 출력
# str() - 데이터 속성 출력
# summary() - 요약 통계량 출력

exam = read.csv("csv_exam.csv")

head(exam)  # 앞에서부터 6행까지 출력
head(exam, 10)  # 앞에서부터 10행까지 출력

tail(exam)
tail(exam, 15)

View(exam)  # 데이터 뷰어 창에서 exam 데이터 확인

dim(exam)  # 행, 열 출력

str(exam)  # 데이터 속성 확인 - 모든 변수의 속성을 보여줌

summary(exam) # 요약 통계량 출력

install.packages("ggplot2")
library(ggplot2)
mpg = as.data.frame(ggplot2::mpg)

head(mpg, 5)
tail(mpg, 5)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)

?mpg

# 변수명 바꾸기
df_raw = data.frame(var1 = c(1, 2, 1),
                    var2 = c(2, 3, 2))
df_raw

install.packages("dplyr")
library(dplyr)

df_new = df_raw
df_new

df_new = rename(df_new, v2 = var2)  # var2 변수명을 v2로 변경
df_new

df_new = rename(df_new, v1 = var1)
df_new

df_raw
df_new

## 혼자서 해보기
# Q1. ggplot2() 패키지의 mpg 데이터를 사용할 수 있도록 불러온 후 복사본
install.packages("ggplot2")
library(ggplot2)
mpg = as.data.frame(ggplot2::mpg)
mpg
mpg_new = mpg
mpg_new

# Q2. 복사본 데이터를 이용해 cty는 city, hwy는 highway로 수정
mpg_new = rename(mpg_new, city = cty)
mpg_new = rename(mpg_new, higyway = hwy)

head(mpg_new, 3)


# 파생변수 만들기
df = data.frame(var1 = c(4, 3, 8),
                var2 = c(2, 6, 1))
df

df$var_sum = df$var1 + df$var2  # var_sum 파생변수 생성
df

df$var_mean = (df$var1 + df$var2)/2  # var_mean 파생변수 생성
df

# 통합 연비 변수 생성 (cty + hwy)
mpg$total = (mpg$cty + mpg$hwy)/2
head(mpg, 3)

mean(mpg$total)  # 통합 연비 변수 평균

# 조건문을 활용한 파생변수
# '고연비 합격 판정' 받은 자동차

# 1. 기준값 정하기
summary(mpg$total)
hist(mpg$total)

# 2. 합격 판정 변수 만들기
ifelse(mpg$total >= 20, "pass", "fail")
mpg$test = ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 3)

# 3. 빈도표로 합격 판정 수 알아보기
table(mpg$test)  # 연비 합격 빈도표 생성
qplot(mpg$test)

# 중첩 조건문 활용하기
mpg$grade = ifelse(mpg$total >= 30, "A",
                   ifelse(mpg$total < 20, "C", "B"))
head(mpg, 3)
table(mpg$grade)

qplot(mpg$grade)

# A, B, C, D 등급 부여
mpg$grade2 = ifelse(mpg$total >= 30,"A",
                    ifelse(mpg$total >= 25, "B",
                          ifelse(mpg$total >= 20, "C", "D")))

head(mpg, 3)
table(mpg$grade2)

qplot(mpg$grade2)

## 분석 도전!!
#문제1. ggplot2의 midwest 데이터를 데이터 프레임 형태로
midwest = as.data.frame(ggplot2::midwest)
head(midwest, 3)
tail(midwest, 3)
dim(midwest)
str(midwest)
View(midwest)
summary(midwest)

#문제2. poptotal -> total, popasian -> asian으로 변경
midwest = rename(midwest, total = poptotal)
midwest = rename(midwest, asian = popasian)
head(midwest, 3)

#문제3. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 추가
midwest$percofasian = (midwest$asian / midwest$total)*100
hist(midwest$percofasian)

#문제4. 아시아 인구 백분율 전체 평균, 초과시 "large", 그외 "small"
mean(midwest$percofasian)
midwest$mean = ifelse(midwest$percofasian > 0.4872462, "large", "small")
head(midwest, 3)

table(midwest$mean)
qplot(midwest$mean)