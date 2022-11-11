# --------------------------------------------------------------
# 사용자 정의 클래스 => 학생을 표현하는 데이터 타입
# --------------------------------------------------------------
# 특징/ 성질/ 외형/ => 변수 --- 필드/속성 (Dilfe/Attribute)
#                       교복, 급식, 학교, 담임, 성적.
# 역할/기능        => 함수 --- 메서드 (Method)
#                       공부한다, 학교에 간다, 시험친다.
# --------------------------------------------------------------
# 클래스명 => student
# 속   성 => 학번, 학교, 학년, 석차
# 역   할 => 공부하다, 시험친다
# --------------------------------------------------------------
class student:
    # 클래스 변수 -> 모든 인스턴스가 함께 사용함
    school = "대구중학교"

    # 인스턴스(객체) 생성 시 초기화 메서드
    def __init__(self, stdNum, grade, yearNum):
        self.stdNum = stdNum
        self.grade = grade
        self.yearNum = yearNum

    # student의 클래스 역할/기능 메서드
    # 000이 무슨 과목을 공부한다.-----
    def study(self, subject):
        print(f"{self.stdNum}은 {subject}를 공부한다")

    # 000이 000시험을 친다
    def test(self, title):
        print(f"{self.stdNum}는 {title}를 친다")

    # 학생 정보 출력 기능
    # 학번 학년 학교 정보 출력
    def displayInfo(self):
        print(f"학교 : {student.school}")
        print(f"학번 : {self.stdNum}")
        print(f"학년 : {self.grade}")


# 객체 즉 student 인스턴스(Instance) 생성
st1 = student(1111, 4, 2)
st2 = student(2222, 36, 1)
st3 = student(1323, 56, 3)

st1.displayInfo()
