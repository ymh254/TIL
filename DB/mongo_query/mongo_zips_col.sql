use zips_db

db.zips_col.count()

db.zips_col.find().limit(20)

//select distint(state) from zips
db.zips_col.aggregate([
    {
        $group: {_id:"$state"}
    }
])

//1. SQL: SELECT COUNT(*) AS count FROM zip
db.zips_col.aggregate([
    {
        $group:{
            _id:null,
            count:{$sum:1}
        }
    }
])

//2. SQL: SELECT SUM(pop) as total_pop AS count FROM zip
db.zips_col.aggregate([
    {
        $group:{
            _id:null,
            total_pop:{$sum:"$pop"}
        }
    }
])

//3. SQL: SELECT state, SUM(pop) as total_pop FROM zip GROUP BY state
db.zips_col.aggregate([
    {
        $group:{
            _id:"$state",
            total_pop:{$sum:"$pop"}
        }
    }
])

//4. SQL : select city, sum(pop) as total_pop from zip group by city
db.zips_col.aggregate([
    {
        $group:{
            _id:"$city",
            total_pop:{$sum:"$pop"}
        }
    }
])

//5. SQL: SELECT state, SUM(pop) as total_pop FROM zip GROUP BY state ORDER BY as total_pop
db.zips_col.aggregate([
    {
        $group:{
            _id:"$state",
            total_pop:{$sum:"$pop"}
        }
    },
    {
        $sort:{
            total_pop:1
        }
    }
])

//6. # SQL: SELECT COUNT(*) FROM zip WHERE state = 'MA'
db.zips_col.aggregate([
    {
        $match:{state:"MA"}
    },
    {
        $group:{
            _id:null,
            count:{$sum:1}
        }
    }
])

//7. select state,sum(pop) as total_pop from zip where state = 'MA' group by state
db.zips_col.aggregate([
    {
        $match:{state:"MA"}
    },
    {
        $group:{_id:"$state", total_pop:{$sum:"$pop"}}
    }
])
//select city
db.zips_col.aggregate([
    {
        $match:{state:"MA"}
    },
    {
        $group:{_id:"$city", total_pop:{$sum:"$pop"}}
    }
])
//7.1 select state,sum(pop) as total_pop from zip where state in ('DE', 'MS') group by state
db.zips_col.aggregate([
    {
        $match:{state:{$in:["DE","MS"]}}
    },
    {
        $group:{
            _id:"$state",
            total_pop:{$sum:"$pop"}
        }
    }
])

//8. SELECT state, SUM(pop) as total_pop FROM zip GROUP BY state HAVING SUM(pop) >= 10000000
db.zips_col.aggregate([
    {
        $group:{
            _id:"$state",
            total_pop:{$sum:"$pop"}
        }
    },
    {
        $match:{
            total_pop: {$gte:10*1000*1000}
        }
    }
])

//9.1000만 이상의 state 별 총 인구를 state_pop 필드명으로 출력하고 _id는 출력하지 않기
//5개 건수만 출력.
db.zips_col.aggregate([
    {$group:{_id:"$state",state_pop:{$sum:"$pop"}}},
    {$match:{state_pop:{$gte:10000000}}},
    {$project:{_id:0,state_pop:1}},
    {$limit:5}
])
//9.1 NY state의 city별 총 인구수를 city_pop 필드명으로 출력하고 _id는 출력하지 않는다.
db.zips_col.aggregate([
    {$match:{state:"NY"}},
    {$group:{_id:"$city",city_pop:{$sum:"$pop"}}},
    {$project:{_id:0,city_pop:1}},
    {$limit:5}
])

//10. 1000만 이상의 state만 내림차순 정렬하여 3개만 가져오기
//state 별 인구수의 합계가 1000만 이상
db.zips_col.aggregate([
    {$group:{_id:"$state",state_pop:{$sum:"$pop"}}},
    {$match:{state_pop:{$gte:10000000}}},
    {$sort:{state_pop:-1}},
    {$limit:3}
])
//10.1. 1000만 이상의 state만 내림차순 정렬하여 3개만 가져오기
//state 별 인구수의 합계가 1000만 이상
//_id는 출력하지 않고, 인구수만 출력
db.zips_col.aggregate([
    {$group:{_id:"$state",state_pop:{$sum:"$pop"}}},
    {$match:{state_pop:{$gte:10000000}}},
    {$sort:{state_pop:-1}},
    {$project:{_id:0,state_pop:1}},
    {$limit:3}
])

//11.1000만 이상의 state 별 총 인구를 state_pop 필드명으로 출력하고,
// _id는 출력하지 않으며, 가장 많은 인구를 가진 3개만 출력하기


//12. select state, city, sum(pop) as total_pop from zip group by state,city
 db.zips_col.aggregate([
    {
        $group:{
            _id:{
                state:"$state",
                city:"$city"
            },
            total_pop:{$sum:"$pop"}
        }
    }
 ])
//column 따로 보
 db.zips_col.aggregate([
    {$group:{_id:{state:"$state",city:"$city"},total_pop:{$sum:"$pop"}}},
    {$project:{"_id.state":1,total_pop:1}}
 ])

//13. select state, city, sum(pop) as total_pop from zip GROUP BY state, city HAVING city = 'POINT BAKER'
db.zips_col.aggregate([
    {
        $group:{
            _id:{
            state:"$state",city:"$city"
            },
            total_pop:{$sum:"$pop"}
        }
    },
    {
        $match:{
            "_id.city":"POINT BAKER"
        }
    }
])

//14. SELECT AVG(pop) FROM zip GROUP BY state, city
db.zips_col.aggregate([
    {
        $group:{
            _id:null,
            avg_pop:{$avg:"$pop"}
        }
    }
])
//select state, city, AVG(pop) from zip group by state, city
db.zips_col.aggregate([
    {
        $group:{
            _id:{
                state:"$state",
                city:"$city"
            },
            avg_pop:{$avg:"$pop"}
        }
    }
])

//15. select state,city, avg(pop) as avg_pop from zip GROUP BY state, city having avg_pop > 30000
//주별 도시 인구 평균이 30000 이 넘는 곳의 state 와 city 이름만 출력하고 평균을 출력하지 않기 (3개만 출력하기)
db.zips_col.aggregate([
    {
        $group:{
            _id:{
                state:"$state",
                city:"$city"
            },
            avg_pop:{$avg:"$pop"}
        }
    },
    {
        $match:{
            avg_pop:{
                $gte:30000
            }
        }
    },
    {
        $project:{
            "_id.city":1,
            avg_pop:1
        }
    },
    {
        $limit:3
    }
])