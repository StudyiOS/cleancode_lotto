# 🚿 cleancode_lotto

# 로또 번호 조회

## 과제 설명

이 과제는 회차에 따른 로또 번호와 당첨 금액을 조회하는 과제입니다.
클린 코드를 활용해 작성해보세요.

## 기능

* 회차 선택
* 날짜 조회
* 로또 번호 조회
* 당첨 금액 조회

## 기술

* Swift
* Xcode

## 개발 일정

* 2023년 12월 4일 ~ 2023년 12월 11일

## 추가 고려사항

* 기능만 만족한다면, UI는 자유롭게!
* 언어나 프레임워크는 자유롭게!
* 아키텍처도 자유롭게!
* README도 작성하면 좋을 것 같아요!

### API

* http://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(num)


---

## Sam 구현 내용
1. 회차 초기값: 가장 최근 회차 
2. Picker로 조회 원하는 회차 선택 -> '조회하기' 버튼 클릭 -> modal에 선택한 회차에 대한 결과값 확인
3. Mock Data 설정

![Simulator Screen Recording - iPhone 15 Pro - 2023-12-11 at 20 51 33](https://github.com/StudyiOS/cleancode_lotto/assets/126672733/81dcde2c-9dab-44ed-b67d-4f97e97c3326)

---

### Leo 구현 내용
1. 기능 설명
- 로또 최근 당첨결과를 초기화면으로 보여줌
- 회차 피커 선택 이후 API 호출하여 정보 보여주도록 구현
2. 구현 미리보기
![Simulator Screen Recording - iPhone 15 - 2024-01-08 at 21 32 38](https://github.com/StudyiOS/cleancode_lotto/assets/59555700/e58103ed-d2df-4b4c-a2b5-10271c11c01b)

