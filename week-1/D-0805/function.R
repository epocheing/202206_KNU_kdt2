# 함수형 프로그래밍


n <- 13
order <- function(v) {
    ifelse(v %% 15 == 0, 'PZPS',

    ifelse(v %% 13 == 0, 'PZ')
    )
}


