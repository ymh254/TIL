# MongoDB

- MongoDB는 collection 생성시 _id가 각 Document마다 자동 생성되어 primary key 역할을 한다.

###  Create/Insert

> DB 생성 및 switch

```
use [DB명]
```

> Collection 생성

```
db.createCollection("users")
```

> DB 상태 확인

```
db.stats()
```

> Document 입력

```
db.users.insertOne({...}) -한개의 document생성
db.users.insertMany([...]) -document list 생성
```

### Document 읽기

```
db.users.findOne() -매칭되는 한개의 docment 검색
db.users.find() -매칭되는 document list 검색
```

- 비교 연산자 (sql vs MongoDB)

| sql        | MongoDB            |
| ---------- | ------------------ |
| =          | $eq                |
| >          | $gt                |
| >=         | $gte               |
| in         | $in                |
| <          | $lt                |
| <=         | $lte               |
| !=         | $ne                |
| not in     | $nin               |
| like "%bc" | $regex: /bc/       |
| Order by   | .sort({user_id:1}) |

(.sort({user_id: -1})로 치면 역순으로 나열됨.)

### Document 수정

- Update

```
db.users.updateOne()
db.users.updateMany({조건}, {$set:{field:value}})
```

(컬럼값 삭제 시 $unset)



- Delete

```
db.users.deleteOne()
db.user.deleteMany({filed:value})
```



### Aggregation Pipeline

- 기존의 find() 함수로는 원하는 데이터로 가공하려면 제약이 있는데 aggregate()함수를 이용하면 해결할 수 있다.

- Aggreagation Mapping Chart
  - `$project` : 어떤 필드를 숨기고, 어떤 필드를 새로 만들지 정함
  - `group` : _id 값으로 지정된 내용이 같은 document끼리 그룹화 
  - `$match` : document를 필터링해서 반환
  - `$unwind` : 입력 도큐먼트에서 배열 필드를 분해해 각 요소에 대한 도큐먼트로 분리하여 출력
  - `$out` : 파이프라인의 결과를 컬렉션에 기록

| SQL      | MongoDB Aggregation Operators |
| -------- | ----------------------------- |
| where    | $match                        |
| Group by | $group                        |
| having   | $match                        |
| select   | $project                      |
| Order by | $sort                         |
| limit    | $limit                        |
| Sum()    | $sum                          |
| Count()  | $sum                          |
| Join     | $lookup                       |

