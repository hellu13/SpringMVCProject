# Spring MVC 프로젝트 (책 Farm)

## 책 Farm 소개
+ 중고서적을 구매/판매하기 위한 게시판 형태의 홈페이지

## 사용 프로그램
+ Eclipse(2020-12)
+ JDK 8
+ Apache tomcat 9.0
+ Oracle Database 11g
+ SqlDeveloper

## 사용 라이브러리
+ Java Servlet API 4.0.1
+ JavaServer Pages API 2.3.3
+ JSTL 1.2
+ Spring Web MVC 5.3.2
+ Bean Validation API 2.0.1.Final
+ Hibernate Validator Engine 6.1.2.Final
+ Spring JDBC 5.2.3.RELEASE
+ Apache Commons DBCP 2.7.0
+ MyBatis 3.5.4
+ MyBatis Spring 2.0.4

## 프로젝트 구조
<img width="452" alt="mvc" src="https://user-images.githubusercontent.com/46749717/106530688-2647b000-6530-11eb-885c-4533ff575d50.PNG">

## 구현 기능
+ 화면 구성
  + 상단/하단 메뉴 구성
  > 모든 요청 주소에 대해 출력
  > Controller의 메서드가 호출되기 전에 처리하기 위해 HandlerInterceptor 인터페이스의 preHandle 메서드로 구현
  > 경로 패턴을 "/**"로 주어 모든 주소에 대해 인터셉터가 동작하여 모든 페이지에 상단 메뉴가 보이도록 
  + 메인 페이지 구성
  + 페이징
  
+ 회원 관리
  + 회원 가입
  + 로그인/로그아웃
  + 정보 수정
  
+ 게시판
  + 글 작성
  + 글 수정
  + 글 삭제
  + 글 목록 출력
 
