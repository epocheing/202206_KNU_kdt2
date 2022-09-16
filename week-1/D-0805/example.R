# 연습문제 풀이 방법
area = function(v) return(v ^ 2)

x <- c(5, 10, 15)
y <- area(x)

area = function(v) v ^ 2
sapply(x, area)


# 연습문제 실습
## round
round = function(v) {
    return(3.14 * 2 * v)
}

y = round(x)
y

round = function(v) 3.14 * 2 * v
sapply(x, round)

## area
area = function(v) {
    return((v^2) * 3.14)
}

y = area(x)
y


