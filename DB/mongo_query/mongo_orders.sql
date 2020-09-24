use mymongo_db

db.createCollection("orders")

db.orders.insertMany([{
cust_id: "abc123",
ord_date: ISODate("2012-01-02T17:04:11.102Z"), status: 'A',
price: 100,
items: [ { sku: "xxx", qty: 25, price: 1 },
{ sku: "yyy", qty: 25, price: 1 } ]
}, {
cust_id: "abc123",
ord_date: ISODate("2012-01-02T17:04:11.102Z"), status: 'A',
price: 500,
items: [ { sku: "xxx", qty: 25, price: 1 },
{ sku: "yyy", qty: 25, price: 1 } ]
}, {
cust_id: "abc123",
ord_date: ISODate("2012-01-02T17:04:11.102Z"),
status: 'B',
price: 130,
items: [ { sku: "jkl", qty: 35, price: 2 },
{ sku: "abv", qty: 35, price: 1 } ]
}, {
cust_id: "abc123",
ord_date: ISODate("2012-01-02T17:04:11.102Z"), status: 'A',
price: 130,
items: [ { sku: "xxx", qty: 15, price: 1 },
{ sku: "yyy", qty: 15, price: 1 } ]
}, {
cust_id: "abc456",
ord_date: ISODate("2012-02-02T17:04:11.102Z"), status: 'C',
price: 70,
items: [ { sku: "jkl", qty: 45, price: 2 },
{ sku: "abv", qty: 45, price: 3 } ]
}, {
cust_id: "abc456",
ord_date: ISODate("2012-02-02T17:04:11.102Z"), status: 'A',
price: 150,
items: [ { sku: "xxx", qty: 35, price: 4 }, { sku: "yyy", qty: 35, price: 5 } ]
}, {
cust_id: "abc456",
ord_date: ISODate("2012-02-02T17:04:11.102Z"), status: 'B',
price: 20,
items: [ { sku: "jkl", qty: 45, price: 2 },
{ sku: "abv", qty: 45, price: 1 } ]
}, {
cust_id: "abc780",
ord_date: ISODate("2012-02-02T17:04:11.102Z"), status: 'B',
price: 260,
items: [ { sku: "jkl", qty: 50, price: 2 }]
}])

db.orders.find()

//select count(*) as count from orders
db.orders.aggregate([
    {$group:{
        _id:null,
        count:{$sum:1}
    }}
])

//select sum(price) as total from orders
db.orders.aggregate([
    {
        $group:{
            _id:null,
            mytotal:{$sum:"$price"}
        }
    }
])

//select cust_id,sum(price) as total from orders group by cust_id
db.orders.aggregate([
    {
        $group:{
            _id:"$cust_id",
            total:{$sum:"$price"}
        }
    }
])

//select cust_id,sum(price) as total from orders group by cust_id
//order by total desc
db.orders.aggregate([
    {
        $group:{
            _id:"$cust_id",
            total:{$sum:"$price"}
        }
    },
    {
        $sort:{
            total: -1
        }
    }
])
//select cust_id, ord_data,sum(price) as total
// from orders group by cust_id,ord_date
db.orders.aggregate([
    {
        $group :{
            _id:{
                cust_id:"$cust_id",
                ord_date:{$dateToString:{format:"%Y-%m-%d",date:"$ord_date"}}
            },
            total:{$sum:"$price"}
        }
    }
])
db.orders.find()

db.orders.aggregate([
    {
        $group:{
            _id:"$ord_date",
            total:{$sum:"$price"}
        }
    }
])
//select cust_id,count(*) from orders group by cust_id having count(*) > 1
db.orders.aggregate([
    {
        $group:{
            _id:"$cust_id",
            count:{$sum:1}
        }
    },
    {
        $match:{count:{$gt:1}}
    }
])
//select status,count(*) from orders group by status having count(*) > 1
//order by count
db.orders.aggregate([
    {
        $group:{
            _id:"$status",
            count:{$sum:1}
        }
    },
    {
        $match:{count:{$gt:1}}
    },
    {
        $sort:{count:-1}
    }
])
//select cust_id,ord_date,sum(price) total
//from orders group cust_id,ord_date
//having total > 250
db.orders.aggregate([
    {
        $group:{
            _id:{
                cust_id:"$cust_id",
                ord_date:"$ord_date"
            },
            total:{$sum:"$price"}
        }
    },
    {
        $match:{total:{$gt:250}}
    }
])
//select distinct (status) from orders
db.orders.aggregate([
    {
        $group:{
            _id:"$status"
        }
    }
])
//select cust_id,sum(price) as total from orders
//where stauts = 'A'
//group by cust_id
db.orders.aggregate([
    {
        $match:{status:'A'}
    },
    {
        $group:{
            _id:"$cust_id",
            total:{$sum:"$price"}
        }
    }
])
db.orders.find({status:'A'},{cust_id:1,status:1,price:1,_id:0})
//select cust_id,ord_date,sum(price) as total
//from orders
//where status='B'
//group by cust_id, ord_date
//having total > 250
db.orders.aggregate([
    {
        $match:{status:'B'}
    },
    {
        $group:{
            _id: {
                cust_id:"$cust_id",
                ord_date:{$dateToString:{format:"%Y-%m-%d",date:"$ord_date"}}
            },
            total: {$sum:"$price"}
        }
    },
    {
        $match:{total:{$gt:100}}
    }
])
db.orders.find({status:'B'},{cust_id:1,ord_date:1,status:1,price:1,_id:0})
//inventory collection 생성하고, $unwind 연산자 사용
db.createCollection("inventory")
show collections
db.inventory.insert({
    id:1,item:"ABC1",sizes:["S","M","L"]
})
db.inventory.insertOne({
    id:1,item:"EDF1",sizes:["S","M","L","XL"]
})
db.inventory.find()

db.inventory.aggregate([
    {
        $unwind:"$sizes"
    }
])
db.orders.find({},{cust_id:1,items:1,_id:0})
db.orders.aggregate([
    {
        $unwind:"$items"
    },
    {
        $group:{
            _id:"$cust_id",
            qtysum:{$sum:"$items.qty"}
        }
    }
])