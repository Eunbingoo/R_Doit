# Doit R 데이터 분석 02) 데이터 프레임과 외부 데이터

# data.frame 이해하기
# '열'은 속성을 나타낸다. 'column' or 'variable'

# data.frame 만들기
english = c(90, 80, 60, 70)  # 영어 점수 변수 생성
english

math = c(50, 60, 100, 20)   # 수학 점수 변수 생성
math

df_midterm = data.frame(english, math)
df_midterm

class = c(1, 1, 2, 2)    # 반 정보 변수 추가 생성
class

df_midterm = data.frame(english, math, class)
df_midterm

# 분석하기
mean(df_midterm$english) # df_midterm의 english로 평균 산출
mean(df_midterm$math) # df_midterm의 math로 평균 산출

# data.frame 한 번에 만들기
df_midterm = data.frame(english = c(90, 80, 60, 70),
                        math = c(50, 60, 100, 20),
                        class = c(1, 1, 2, 2))
df_midterm


## 혼자서 해보기
# Q1. data frame 만들기
df_sale = data.frame(product = c("apple", "strawberry", "watermelon"),
                     price = c(1800, 1500, 3000),
                     volume = c(24, 38, 13))
df_sale

# Q2. 과일 가격 평균, 판매량 평균 구하기
mean_price = mean(df_sale$price)
mean_volume = mean(df_sale$volume)
mean_price
mean_volume

# 외부 데이터 이용하기
install.packages("readxl")
library(readxl)

df_exam = read_excel("excel_exam.xlsx")  # 엑셀 파일 불러와 df_exam에 할당당
df_exam
head(df_exam, 3)
df_exam = read_excel("C:/Users/dmsql/Desktop/Eunbing/Rproject/excel_exam.xlsx")
# 프로젝트 폴더가 아닌 다른 폴더에 있는 엑셀 파일 불러올 때, 경로 지정 (/)

# 분석하기
mean(df_exam$english)
mean(df_exam$science)

df_exam_novar = read_excel("C:/Users/dmsql/Desktop/Eunbing/Rproject/excel_exam_novar.xlsx")
head(df_exam_novar, 3)
# 엑셀 파일의 첫 행이 변수 명이 아닐 때!!
df_exam_novar = read_excel("C:/Users/dmsql/Desktop/Eunbing/Rproject/excel_exam_novar.xlsx",
                           col_names = F)
head(df_exam_novar, 3)

# 엑셀 파일의 세 번째 sheet 데이터 불러오기
df_exam_sheet = read_excel("C:/Users/dmsql/Desktop/Eunbing/Rproject/excel_exam_sheet.xlsx",
                           sheet = 3)
head(df_exam_sheet, 3)

df_csv = read.csv("C:/Users/dmsql/Desktop/Eunbing/Rproject/csv_exam.csv")
head(df_csv, 3) # csv파일 불러올 때, 첫 행이 변수 명이 아닐 경우, col_names 대신 header 사용

# data frame 을 csv 파일로 저장하기
df_midterm = data.frame(english = c(90, 80, 60, 70),
                        math = c(50, 60, 100, 20),
                        class = c(1, 1, 2, 2))
df_midterm
write.csv(df_midterm, file = "df_midterm.csv")

# RDS 파일 활용하기
saveRDS(df_midterm, file = "df_midterm.rds")
readRDS("df_midterm.rds")
rm(df_midterm)

df_midterm = readRDS("df_midterm.rds")
df_midterm