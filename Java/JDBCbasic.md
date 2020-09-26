# JDBC

(=Java Database Connectivity)

: Java Program에서 Database에 연결(접속)할 수 있도록 하는 자바 API로서 자료를 query하거나 update를 할 수 있게 함.

> JDBC Coding 절차

1. Driver 등록

   : DriverManager에 해당 DBMS Driver 등록

   //DBMS (Database Management System)

   : Database를 조작하는 별도의 소프트웨어

   (Ex. Oracle, My_SQL)

```
Class.forName( "oracle.jdbc.driver.OracleDriver“ );
```

2. DBMS와 연결

   : 해당 Driver로부터 Connection instance를 획득

```
public static Connection getConnection(
			 String Url, String user, String
			 password) throws SQLException
```

```
Connection conn = DriverManager.getConnection(
	“jdbc:oracle:thin:@192.168.0.200:1521:VCC”, 	“EXXXXX”,
	“EXXXXX”
);
```

3. Statement 생성

   : Connection instance로부터 Statement instance획득

```
Statement stmt = conn.createStatement();
```

4. SQL전송 및 결과 받기

   :Statement method를 이용하여 SQL 실행  후 결과를 ResultSet(SELECT) 혹은 int형 변수(DML)로 받아 처리

   //DML(Data Manipulation Language): 데이터 베이스에 레코드를 조회, 삽입, 수정, 삭제하는 언어

`Select`

```
String query = "SELECT ID, LAST_NAME FROM EMP";
ResultSet rset = stmt.executeQuery( query );
while ( rset.next() ) {
	System.out.println( rset.getString( "ID" ) + 	 "\t" + rset.getString( 2 ) );
}
```

`DML`

```
String query = "UPDATE EMP " +
							 " SET LAST_NAME = 'KIM' "+
							 " WHERE ID = '100000' ";
int result = stmt.executeUpdate( query );
```



5. 닫기

   : 사용한 자원 반납

`Select`

```
rset.close(); 
stmt.close(); 
conn.close();
```

`DML`

```
stmt.close(); 
conn.close();
```



