# Spring MVC 프로젝트 (책 Farm)  
  
  
## 책 Farm 소개
+ 중고서적을 구매/판매하기 위한 게시판 형태의 홈페이지  
  
  
### 프로젝트 설정
+ Maven
+ JDK 1.8
+ Oracle Database 11g
+ Apache tomcat 9.0
+ Java Configuration  
  
  
## 사용 프로그램
+ Eclipse(2020-12)
+ SqlDeveloper  
  
  
## 사용 플랫폼
+ Bootstrap 4
+ Toast UI (Grid)  
  
  
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
+ Jackson Databind 2.11.3  
  
  
## 프로젝트 구조
<img width="613" alt="mvc" src="https://user-images.githubusercontent.com/46749717/107127827-1e0abe80-68fc-11eb-8f93-419917630024.PNG">   

  
  
## 구현 기능
+ 화면 구성
  + 상단/하단 메뉴 구성
    + 게시판 이름들을 가져와 구성
    + 로그인/로그아웃, 정보수정 페이지 가능
    ```
    > Intercpetor 인터페이스의 PreHandle 메서드로 구현
    > 모든 요청 주소에 Inteceptor가 동작하도록하여 모든 페이지에 상단/하단 메뉴 출력
    ```
    주요 코드   
    [TopMenuInterceptor.java](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/src/com/bookfarm/interceptor/TopMenuInterceptor.java) / [ServletAppContext.java](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/src/com/bookfarm/config/ServletAppContext.java) / [top_menu.jsp](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/WebContent/WEB-INF/views/include/top_menu.jsp)   
       
  + 메인 페이지 구성
    + 판매 상태가 "판매중"인 도서에 한해서 출력
    + 책 제목 검색, 가격순으로 정렬, 페이징 가능
    ```
    > Restful API 서버 사용
    > @RestController를 통해 JSON 형태로 데이터를 전달하여 AJAX 통신을 통하여 브라우저에 출력
    > Toast UI Grid를 사용하여 데이터 출력
    > Tosat UI Grid를 통한 데이터 검색, 정렬, 페이징 기능 추가
    ```
    주요 코드   
    [RestApiController.java](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/src/com/bookfarm/controller/RestApiController.java) / [main.jsp](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/WebContent/WEB-INF/views/main.jsp)  
      
      
+ 회원 관리
  + 회원 가입
    + Form에 맞춰 회원 가입에 필요한 정보 입력
    + 비밀번호와 비밀번호 확인 값이 다르면 경고 메시지 출력
    ```
    > Hibernate Validator를 사용하여 입력 값 유효성 검사
    > 프로퍼티 파일을 등록해 에러 메시지 커스터 마이징 후 출력
    > 기본 제공 유효성 검사 외 유효성 검사는 Validator 인터페이스의 initbinder 메소드로 구현
    ```
    주요 코드   
    [UserValidator.java](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/src/com/bookfarm/validator/UserValidator.java) / [user_join.jsp](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/WebContent/WEB-INF/views/user/join.jsp)      
    
  + 로그인/로그아웃
    + 로그인 여부에 따라 로그인 혹은 로그아웃 버튼 출력
    + 로그인시 아이디, 비밀번호 입력
    + 잘못된 아이디, 비밀번호 입력 시 경고 메시지 출력
    ```
    > 아이디, 비밀번호 입력에 대한 유효성 검사
    > 로그인 성공 시 사용자 정보를 세션 영역에 저장
    > Interceptor를 통해 로그인 여부를 확인
    ```
    주요 코드   
    [RootAppContext.java](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/src/com/bookfarm/config/RootAppContext.java) / [user/login.jsp](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/WebContent/WEB-INF/views/user/login.jsp)   
    
  + 정보 수정
    + 사용자 비밀번호 변경
    + 비밀번호, 비밀번호 확인 값이 다르면 경고 메시지 출력
    ```
    > Validator 인터페이스의 initbinder 메소드에 비밀번호 일치 여부 확인 코드 작성
    ```
    주요 코드   
    [UserValidator.java](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/src/com/bookfarm/validator/UserValidator.java) / [user_modify.jsp](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/WebContent/WEB-INF/views/user/modify.jsp)  
      
      
+ 게시판
  + 글 작성
    + 로그인한 사용자에 한해 게시글 작성 가능
    + Form에 맞춰 글 작성에 필요한 정보 입력
    ```
    > Interceptor를 통해 로그인 여부 체크
    > 이미지 업로드를 위해 StandardServletMultipartResolver 인터페이스 Bean 등록 
    ```
    주요 코드  
    [CheckLoginInterceptor.java](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/src/com/bookfarm/interceptor/CheckLoginInterceptor.java) / [BookService.java](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/src/com/bookfarm/service/BookService.java) / [book_write.jsp](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/WebContent/WEB-INF/views/book/write.jsp)   
    
    
  + 글 읽기
      + 글 목록에서 제목을 클릭하면 해당 게시글 열람 가능
      + 글 작성자와 로그인한 사용자가 같을 경우에만 글 수정/삭제 버튼 출력
      + 해당 게시판 목록 페이지로 이동 가능   

  + 글 수정
    + 작성자, 게시일을 제외한 게시글 수정 가능
    + Form에 맞춰 입력하지 않을 시 경고메시지 출력
    ```
    > 직접 해당 주소를 입력하여 접속하는 것을 방지하기 위해 해당 주소를 Inteceptor로 처리
    ```
    주요 코드   
    [CheckWriterInterceptor.java](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/src/com/bookfarm/interceptor/CheckWriterInterceptor.java) / [ServletAppContext.java](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/src/com/bookfarm/config/ServletAppContext.java) / [book_modify.jsp](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/WebContent/WEB-INF/views/book/modify.jsp)   
    
  + 글 삭제
    + 글 삭제 버튼 클릭 시 해당 게시글 삭제
    + 삭제 후 해당 게시판으로 이동   
    
  + 글 목록 출력
    + 게시글의 개수가 많아질 것을 대비해 페이징 기능 구현
    + 한 페이지당 10개의 게시글 출력
    ```
    Bean 객체를 이용하여 전체 페이지 수, 페이지 버튼 개수, 현재 페이지, 이전 페이지, 다음 페이지 값 관리
    RowBounds 클래스를 이용하여 해당 페이지의 글 목록 출력
    ```
    주요 코드   
    [BookService.java](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/src/com/bookfarm/service/BookService.java)   
    
    
  + 글 검색
      + 검색창에 제목을 입력하여 게시글 검색 가능
      + 검색 후 해당 게시글에 한해 페이징 처리
      + 검색이 된 특정 게시글 열람 후 목록보기 클릭 시에도 검색된 게시글들의 목록만 출력
      ```
      검색어와 해당 게시판 번호는 Bean 객체에 저장 후 관리
      ```   
      주요 코드   
      [board_main.jsp](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/WebContent/WEB-INF/views/board/main.jsp) / [BoardController.java](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/src/com/bookfarm/controller/BoardController.java) / [BoardService.java](https://github.com/hellu13/SpringMVCProject/blob/main/SpringProject/src/com/bookfarm/service/BoardService.java)   
   
    
    
 
